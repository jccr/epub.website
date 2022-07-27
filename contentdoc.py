import json

from lxml import etree
from mako.template import Template


ns = {"xhtml": "http://www.w3.org/1999/xhtml"}

head_append_template = Template(filename="templates/head_append.mako")
nav_top_template = Template(filename="templates/nav_top.mako")
nav_bottom_template = Template(filename="templates/nav_bottom.mako")


class ContentDoc:
    def __init__(self, input_file_path, href):
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

    def transform(self, output_file_path, links, metadata):
        parser = etree.XMLParser(resolve_entities=False)
        tree = etree.parse(self.input_file_path, parser)
        root = tree.getroot()
        head = tree.find("xhtml:head", ns)
        body = tree.find("xhtml:body", ns)
        if head is None:
            print("No head found")
            head = tree.getroot()
        if body is None:
            print("No body found")
            body = tree.getroot()

        for item in etree.fromstring(
            "<x>" + head_append_template.render(links=links, metadata=metadata) + "</x>"
        ):
            head.append(item)

        for item in etree.fromstring(
            "<x>" + nav_top_template.render(links=links, metadata=metadata) + "</x>"
        ):
            body.addprevious(item)

        for item in etree.fromstring(
            "<x>" + nav_bottom_template.render(links=links, metadata=metadata) + "</x>"
        ):
            root.append(item)

        tree.write(output_file_path, encoding="utf-8")
