import os

EXCLUDE = {".git", ".github", "README.md", "CNAME", "favicon.ico", "generate_tree.py"}
ROOT = os.path.dirname(os.path.abspath(__file__))

def get_readme_header(readme_path):
    with open(readme_path, "r") as f:
        lines = []
        for line in f:
            if line.strip() == "":
                break
            lines.append(line.rstrip("\n"))
        return lines

def make_link(path, name):
    return f"[{name}]({path})  "

def scan_dir(base, rel=""):
    items = []
    notDirs = []
    for entry in sorted(os.listdir(os.path.join(base, rel))):
        if entry in EXCLUDE:
            continue
        full_path = os.path.join(base, rel, entry)
        rel_path = os.path.join(rel, entry)
        if os.path.isdir(full_path):
            sub_items = scan_dir(base, rel_path)
            items.append((entry, rel_path, sub_items))
        else:
            notDirs.append((entry, rel_path, None))
    items.extend(notDirs)
    return items

def render_tree(items, prefix="", is_base=False):
    lines = []
    for (name, path, children) in items:
        if (is_base and children):
            lines.append("<details>")
            lines.append(f"  <summary>{name}</summary>")
            lines.append("")
        elif not is_base:
            lines.append(f"{prefix}- {make_link(path, name)}  ")
        if children:
            extension = "  " 
            lines.extend(render_tree(children, prefix + extension))
        if (is_base and children):
            lines.append("</details>")
            lines.append("")
    return lines

def main():
    readme_path = os.path.join(ROOT, "README.md")
    header_lines = get_readme_header(readme_path)
    tree = scan_dir(ROOT)
    tree_lines = ["", "## Directories", *render_tree(tree, prefix="", is_base=True)]
    with open(readme_path, "w") as f:
        f.write("\n".join(header_lines + tree_lines) + "\n")

if __name__ == "__main__":
    main()
