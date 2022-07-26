import json

from lxml import etree
from mako.template import Template


ns = {"xhtml": "http://www.w3.org/1999/xhtml"}


class ContentDoc:
    def __init__(self, input_file_path, href):
        self.template = "templates/content.html.mako"
        self.input_file_path = input_file_path
        self.href = href
        self.title = None

    def get_href(self):
        return self.href

    def get_file_path(self):
        return self.input_file_path

    def get_title(self):
        if self.title is None:
            parser = etree.XMLParser(resolve_entities=False)
            tree = etree.parse(self.input_file_path, parser)
            title = tree.find(".//xhtml:title", ns).text
            self.title = title

        return self.title

    def transform(self, output_file_path, links):
        parser = etree.XMLParser(resolve_entities=False)
        tree = etree.parse(self.input_file_path, parser)
        head = tree.find("xhtml:head", ns)
        if head is None:
            print("No head found")
            head = tree.getroot()

        with open(self.template, "r") as f:
            template = Template(f.read())

        rendered = template.render(
            view_state=json.dumps({"links": links}),
            next_href=links["next"]["href"] if links["next"] else None,
            prev_href=links["prev"]["href"] if links["prev"] else None,
        )
        for item in etree.fromstring("<root>" + rendered + "</root>"):
            head.append(item)
        tree.write(output_file_path, encoding="utf-8")
