"""Functions to format the markdown output for the static website engine mkdocs.
"""
from argparse import Namespace
from dataclasses import dataclass
from typing import List
from .config import MKDOCS_FRONT_MATTER
from .gdscript_objects import GDScriptClass


@dataclass
class MkDocsFrontMatter:
    """Container for required front matter data for export to mkdocs-friendly
    markdown"""

    title: str
    description: str
    tags: List[str]

    def as_string_list(self) -> List[str]:
        hide_sections = []
        if "hide_toc" in self.tags:
            hide_sections.append("toc")
            self.tags.remove("hide_toc")
        if "hide_navigation" in self.tags:
            hide_sections.append("navigation")
            self.tags.remove("hide_navigation")

        hide_str = "\n".join(["  - " + section for section in hide_sections])
        if hide_str != "":
            hide_str = "hide:\n" + hide_str

        tags_str = "\n".join(["  - " + tag for tag in self.tags])
        if tags_str != "":
            tags_str = "tags:\n" + tags_str

        strings: List[str] = [self.title, self.description, tags_str, hide_str]

        ret = [MKDOCS_FRONT_MATTER["toml"].format(*strings)]
        return ret

    @classmethod
    def from_data(cls, gdscript: GDScriptClass, arguments: Namespace):
        name: str = "Class " + gdscript.name
        tags: list[str] = gdscript.metadata["tags"] if "tags" in gdscript.metadata else []
        
        if gdscript.name not in tags:
            tags.append(gdscript.name)

        lines: list = gdscript.description.split("\n")
        first_line: str = gdscript.description.replace("\n", "\\n")
        if len(lines) > 0:
            first_line = lines[0]
            
        return MkDocsFrontMatter(
            name,
            first_line, #.replace("\n", "\\n"),
            tags
        )


FRONT_MATTER_DEFAULT: MkDocsFrontMatter = MkDocsFrontMatter("", "", [])


def make_relref(target_document: str, language: str = "gdscript") -> str:
    """Returns a {{< relref >}} shortcode as a string."""
    return make_shortcode(target_document, "relref")


def make_shortcode(content: str, shortcode: str, *arguments: str, **kwargs: str) -> str:
    """Returns a shortcode built from the arguments, with the form
    {{< shortcode *args **kwargs >}}content{{< / shortcode >}}"""
    key_value_pairs: str = " ".join(["{}={}" for key, value in kwargs.items()])
    return "{{{{< {0} {1} {2} >}}}}{3}{{{{< / {0} >}}}}".format(
        shortcode, " ".join(arguments), key_value_pairs, content
    )


def quote_string(text: str) -> str:
    """Quotes and returns the text with escaped \" characters."""
    return '"' + text.replace('"', '\\"') + '"'
