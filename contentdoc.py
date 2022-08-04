from lxml import etree
from mako.template import Template
from mako.lookup import TemplateLookup
from xhtmldoc import XHTMLDoc


template_lookup = TemplateLookup(directories=["."])

head_append_template = Template(
    filename="templates/_head_append.mako", lookup=template_lookup
)
body_before_template = Template(
    filename="templates/_body_before.mako", lookup=template_lookup
)
body_after_template = Template(
    filename="templates/_body_after.mako", lookup=template_lookup
)


class ContentDoc(XHTMLDoc):
    def get_title(self):
        return self.tree.find(".//xhtml:title", XHTMLDoc.namespaces).text

    def transform(self, output_file_path, links, metadata, toc):
        root = self.tree.getroot()
        head = self.tree.find("xhtml:head", XHTMLDoc.namespaces)
        body = self.tree.find("xhtml:body", XHTMLDoc.namespaces)
        if head is None:
            print("No head found")
            head = self.tree.getroot()
        if body is None:
            print("No body found")
            body = self.tree.getroot()

        for item in etree.fromstring(
            "<x>" + head_append_template.render(links=links, metadata=metadata) + "</x>"
        ):
            head.append(item)

        for item in etree.fromstring(
            "<x>"
            + body_before_template.render(links=links, metadata=metadata, toc=toc)
            + "</x>"
        ):
            body.addprevious(item)

        for item in etree.fromstring(
            "<x>" + body_after_template.render(links=links, metadata=metadata) + "</x>"
        ):
            root.append(item)

        self.tree.write(output_file_path, encoding="utf-8")
