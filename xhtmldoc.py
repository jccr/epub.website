from lxml import etree


class XHTMLDoc:
    namespaces = {
        "xhtml": "http://www.w3.org/1999/xhtml",
        "epub": "http://www.idpf.org/2007/ops",
    }

    def __init__(self, input_file_path, href):
        self.input_file_path = input_file_path
        self.href = href
        parser = etree.XMLParser(resolve_entities=False)
        self.tree = etree.parse(self.input_file_path, parser)

    def get_file_path(self):
        return self.input_file_path

    def get_href(self):
        return self.href
