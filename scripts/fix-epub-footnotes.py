#!/usr/bin/env python3
"""Fix pandoc EPUB footnotes for Kobo e-reader compatibility.

Kobo eInk cannot resolve links targeting <aside> elements.
Pandoc generates: <aside epub:type="footnote" id="fn1"><p>text</p></aside>
Kobo needs:       <aside epub:type="footnote"><p id="fn1">text</p></aside>

This script moves the id attribute from <aside> to its inner <p> element.
See: https://github.com/jgm/pandoc/issues/9851
     https://github.com/kobolabs/epub-spec/issues/59
"""

import re
import sys
import zipfile
from io import BytesIO
from pathlib import Path

ASIDE_PATTERN = re.compile(
    r'<aside\s+epub:type="footnote"\s+id="(fn\d+)">\s*<p>'
)
ASIDE_REPLACEMENT = r'<aside epub:type="footnote"><p id="\1">'


def fix_footnotes(epub_path: str) -> int:
    """Fix footnote id placement in an EPUB file. Returns number of fixes."""
    epub = Path(epub_path)
    if not epub.exists():
        print(f"  Skipping {epub_path}: file not found")
        return 0

    buf = BytesIO()
    total_fixes = 0

    with zipfile.ZipFile(epub, "r") as zin, zipfile.ZipFile(buf, "w") as zout:
        for item in zin.infolist():
            data = zin.read(item.filename)

            if item.filename.endswith(".xhtml") or item.filename.endswith(".html"):
                text = data.decode("utf-8")
                text_fixed, count = ASIDE_PATTERN.subn(ASIDE_REPLACEMENT, text)
                if count > 0:
                    total_fixes += count
                data = text_fixed.encode("utf-8")

            zout.writestr(item, data)

    if total_fixes > 0:
        epub.write_bytes(buf.getvalue())

    return total_fixes


if __name__ == "__main__":
    for path in sys.argv[1:]:
        fixes = fix_footnotes(path)
        if fixes:
            print(f"  Fixed {fixes} footnote(s) in {path}")
        else:
            print(f"  No footnotes to fix in {path}")
