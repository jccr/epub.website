from contentdoc import ContentDoc
from ebooklib import epub
from pathlib import Path

from indexdoc import IndexDoc


def get_book_title(book):
    (title, _), *_ = book.get_metadata("DC", "title")
    return title


input_path = "test.zip"
output_path = "out/"
book = epub.read_epub(input_path)

print("Ingesting book '{}'".format(get_book_title(book)))

print("Processing manifest...")
for item in book.get_items():
    file_name = item.get_name()
    path = Path(output_path, file_name)
    path.parent.mkdir(parents=True, exist_ok=True)
    with open(path, "wb") as f:
        f.write(item.content)
        print("Copy {} -> {}".format(file_name, path))


def contentdoc_from_ref(book, ref, filedir):
    (id, _) = ref
    href = book.get_item_with_id(id).get_name()
    file = Path(filedir, href)
    return ContentDoc(file, href)


firstLinearDoc = None

print("Processing spine...")
for i in range(len(book.spine)):
    prev = book.spine[i - 1] if i > 0 else None
    current = book.spine[i]
    next = book.spine[i + 1] if i < len(book.spine) - 1 else None

    prevDoc = contentdoc_from_ref(book, prev, output_path) if prev else None
    currentDoc = contentdoc_from_ref(book, current, output_path)
    nextDoc = contentdoc_from_ref(book, next, output_path) if next else None

    links = {
        "current": {
            "href": currentDoc.get_href(),
            "title": currentDoc.get_title(),
        },
        "next": {"href": nextDoc.get_href(), "title": nextDoc.get_title()}
        if nextDoc
        else None,
        "prev": {"href": prevDoc.get_href(), "title": prevDoc.get_title()}
        if prevDoc
        else None,
    }

    (id, linear) = current
    if linear == "yes" and firstLinearDoc is None:
        firstLinearDoc = currentDoc
        print("First linear doc: {} ({})".format(currentDoc.get_href(), id))

    currentDoc.transform(Path(output_path, currentDoc.get_href()), links)
    print(
        "Transformed {} ({}) [{}]".format(
            currentDoc.get_href(), id, currentDoc.get_title()
        )
    )


if firstLinearDoc is None:
    print("No first linear doc found!")
    exit(1)

if firstLinearDoc.get_href() != "index.html":
    with open(Path(output_path, "index.html"), "w") as f:
        f.write(
            IndexDoc(
                href=firstLinearDoc.get_href(), title=firstLinearDoc.get_title()
            ).render()
        )
        print(
            "Generated stub index doc for first linear doc: {}".format(
                firstLinearDoc.get_href()
            )
        )
else:
    print("First linear doc is index.html, skipping generation of stub index doc")
