from contentdoc import ContentDoc
from ebooklib import epub
import ebooklib
from pathlib import Path

from indexdoc import IndexDoc
from navdoc import NavDoc


def get_book_title(book):
    (title, _), *_ = book.get_metadata("DC", "title")
    return title


input_path = "test.zip"
output_path = "out/"
book = epub.read_epub(input_path)

print("Ingesting book '{}'".format(get_book_title(book)))

print("Processing manifest...")
for item in book.get_items():
    if isinstance(item, epub.EpubNav):
        print(item.get_name(), item.get_type(), item)
    file_name = item.get_name()
    path = Path(output_path, file_name)
    path.parent.mkdir(parents=True, exist_ok=True)
    with open(path, "wb") as f:
        f.write(item.content)
        print("Copy {} -> {}".format(file_name, path))


def doc_from_item(item, filedir, cls=ContentDoc):
    href = item.get_name()
    file = Path(filedir, href)
    return cls(file, href)


def contentdoc_from_id(book, id, filedir):
    item = book.get_item_with_id(id)
    return doc_from_item(item, filedir)


def get_links(current_doc, nextDoc, prevDoc):
    return {
        "current": {
            "href": current_doc.get_href(),
            "title": current_doc.get_title(),
        },
        "next": {"href": nextDoc.get_href(), "title": nextDoc.get_title()}
        if nextDoc
        else None,
        "prev": {"href": prevDoc.get_href(), "title": prevDoc.get_title()}
        if prevDoc
        else None,
    }


linear_spine = list(map(lambda x: x[0], filter(lambda x: x[1] == "yes", book.spine)))
first_linear_doc = (
    contentdoc_from_id(book, linear_spine[0], output_path) if linear_spine else None
)
toc = None

print("Processing table of contents from nav doc...")
for item in book.get_items():
    if isinstance(item, epub.EpubNav):
        nav_doc = doc_from_item(item, output_path, cls=NavDoc)
        toc = {
            "html": nav_doc.get_toc_html_string(),
            "href": nav_doc.get_href(),
        }

print("Processing documents in spine...")

for i in range(len(linear_spine)):
    prev = linear_spine[i - 1] if i > 0 else None
    current = linear_spine[i]
    next = linear_spine[i + 1] if i < len(linear_spine) - 1 else None

    current_doc = contentdoc_from_id(book, current, output_path)
    prev_doc = contentdoc_from_id(book, prev, output_path) if prev else None
    next_doc = contentdoc_from_id(book, next, output_path) if next else None

    current_doc.transform(
        Path(output_path, current_doc.get_href()),
        links=get_links(current_doc, next_doc, prev_doc),
        metadata={"title": get_book_title(book)},
        toc=toc,
    )
    print(
        "Transformed {} ({}) [{}]".format(
            current_doc.get_href(), current, current_doc.get_title()
        )
    )

if first_linear_doc is None:
    print("No first linear doc found!")
    exit(1)

if first_linear_doc.get_href() != "index.html":
    with open(Path(output_path, "index.html"), "w") as f:
        f.write(
            IndexDoc(
                href=first_linear_doc.get_href(), title=first_linear_doc.get_title()
            ).render()
        )
        print(
            "Generated stub index doc for first linear doc: {}".format(
                first_linear_doc.get_href()
            )
        )
else:
    print("First linear doc is index.html, skipping generation of stub index doc")

print("Processing non-linear documents...")

for item in book.get_items():
    if item.get_type() != ebooklib.ITEM_DOCUMENT:
        continue
    if item.get_id() in linear_spine:
        continue

    current_doc = doc_from_item(item, output_path)
    links = {
        "current": {
            "href": current_doc.get_href(),
            "title": current_doc.get_title(),
        },
        "next": None,
        "prev": None,
    }

    current_doc.transform(
        Path(output_path, current_doc.get_href()),
        links=links,
        metadata={"title": get_book_title(book)},
        toc=toc,
    )
    print(
        "Transformed {} ({}) [{}]".format(
            current_doc.get_href(), item.get_id(), current_doc.get_title()
        )
    )
