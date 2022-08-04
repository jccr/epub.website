from xhtmldoc import XHTMLDoc
from lxml import etree


class NavDoc(XHTMLDoc):
    def get_toc_html(self):
        return self.tree.find(
            ".//xhtml:nav[@epub:type='toc']/xhtml:ol", XHTMLDoc.namespaces
        )

    def get_toc_html_string(self):
        return etree.tostring(self.get_toc_html(), pretty_print=True, encoding=str)
