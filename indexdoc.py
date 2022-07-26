from mako.template import Template


class IndexDoc:
    def __init__(self, href, title):
        self.href = href
        self.title = title
        self.template = "templates/index.html.mako"

    def render(self):
        with open(self.template, "r") as f:
            template = Template(f.read())
        return template.render(href=self.href, title=self.title)
