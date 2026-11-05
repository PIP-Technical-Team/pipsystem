"""Run local browser fixtures synchronously, with runtime outputs on E:."""

import os
from pathlib import Path
import re
import subprocess
import sys
import json
from html.parser import HTMLParser


class CodeText(HTMLParser):
    """Collect visible code labels, not inline script data."""

    def __init__(self):
        super().__init__()
        self.in_code = False
        self.labels = []

    def handle_starttag(self, tag, attrs):
        if tag == "code":
            self.in_code = True

    def handle_endtag(self, tag):
        if tag == "code":
            self.in_code = False

    def handle_data(self, data):
        if self.in_code:
            self.labels.append(data)


def main():
    root = Path(__file__).resolve().parents[2]
    base = (root / ".tmp/pipsys/browser").resolve()
    if root.drive.lower() != "e:" or base.drive.lower() != "e:":
        raise RuntimeError("Browser outputs must resolve to E:")
    for name in ("profile", "cache", "crash", "local", "roaming"):
        target = base / name
        target.mkdir(parents=True, exist_ok=True)
        if target.resolve().drive.lower() != "e:":
            raise RuntimeError("Unsafe browser runtime directory")
    env = os.environ.copy()
    env.update(TEMP=str(base), TMP=str(base), TMPDIR=str(base),
               LOCALAPPDATA=str(base / "local"), APPDATA=str(base / "roaming"),
               CHROME_LOG_FILE=str(base / "chrome.log"))
    browser = Path("C:/Program Files/Google/Chrome/Application/chrome.exe")
    if not browser.is_file():
        raise RuntimeError("Installed Chrome not found; no download is attempted")
    static = "--static" in sys.argv[1:]
    inputs = [arg for arg in sys.argv[1:] if arg != "--static"]
    fixture = Path(inputs[0]).resolve() if inputs else root / (
        "site/_site/gen/roadmap.html" if static else "tests/pipsys/site-table-browser.html")
    if static:
        # Global Blink script disabling also prevents --dump-dom's own DOM
        # serialization in this installed browser. Load a script-free copy
        # instead: no page JavaScript can create or restore the table rows.
        source = fixture
        html = re.sub(r"<script\b[^>]*>.*?</script\s*>", "",
                      source.read_text(encoding="utf-8"), flags=re.I | re.S)
        html = html.replace("<head>", f'<head><base href="{source.as_uri()}">', 1)
        fixture = base / "static-roadmap.html"
        fixture.write_text(html, encoding="utf-8")
    # Distinct profiles avoid Chrome forwarding a second synchronous check to
    # an earlier instance whose child processes are still shutting down.
    profile = base / "profile" / f"{fixture.stem}-{os.getpid()}"
    args = [str(browser), "--headless=new", "--no-first-run",
            "--no-default-browser-check", "--disable-background-networking",
            "--disable-component-update", "--disable-sync", "--disable-breakpad",
            "--disable-crash-reporter", "--disable-logging", "--disable-gpu",
            "--host-resolver-rules=MAP * ~NOTFOUND", "--allow-file-access-from-files",
            "--virtual-time-budget=6000", f"--user-data-dir={profile}",
            f"--disk-cache-dir={base / 'cache'}", f"--crash-dumps-dir={base / 'crash'}",
            "--dump-dom", fixture.as_uri()]
    result = subprocess.run(args, capture_output=True, text=True, encoding="utf-8",
                            errors="replace", timeout=90, env=env, check=False)
    (base / f"{fixture.stem}-dom.html").write_text(result.stdout, encoding="utf-8")
    (base / f"{fixture.stem}-stderr.log").write_text(result.stderr, encoding="utf-8")
    marker = re.search(r'<pre id="result"[^>]*>(.*?)</pre>', result.stdout, re.S)
    print(f"Browser exit: {result.returncode}; DOM bytes: {len(result.stdout)}")
    if static:
        parser = CodeText()
        parser.feed(result.stdout)
        roadmap = json.loads((root / "roadmap.json").read_text(encoding="utf-8"))
        ids = [feature["id"] for milestone in roadmap["milestones"]
               for feature in milestone["features"]]
        passed = result.returncode == 0 and all(
            parser.labels.count(feature_id) == 1 for feature_id in ids
        ) and 'class="pip-table-controls"' not in result.stdout and "<script" not in result.stdout.lower()
        print(f"{'PASS' if passed else 'FAIL'}: {len(ids)} task IDs remain visible with all page scripts removed")
        return 0 if passed else 1
    print(marker.group(1) if marker else "FAIL: browser returned no fixture result")
    return 0 if result.returncode == 0 and re.search(
        r'<pre id="result"[^>]*data-passed="true"', result.stdout) else 1


if __name__ == "__main__":
    raise SystemExit(main())
