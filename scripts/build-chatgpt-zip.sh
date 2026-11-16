#!/bin/sh
# Builds dist/daoco-chatgpt-<version>.zip, the package uploaded to ChatGPT's
# plugin directory. ChatGPT reads the listing from .codex-plugin/plugin.json,
# the MCP server from .mcp.json, and the skills from skills/.
set -eu
cd "$(dirname "$0")/.."

manifest=.codex-plugin/plugin.json
version=$(node -e 'console.log(require("./'"$manifest"'").version)')

# Checks ChatGPT's upload or our own conventions have tripped on before.
node - "$manifest" <<'JS'
const fs = require("fs");
const path = require("path");
const manifest = JSON.parse(fs.readFileSync(process.argv[2], "utf8"));
const fail = (message) => { console.error(`build-chatgpt-zip: ${message}`); process.exit(1); };
if (manifest.interface?.screenshots) fail("remove interface.screenshots: the ChatGPT upload rejects it");
for (const key of ["logo", "composerIcon"]) {
  const file = manifest.interface?.[key];
  if (!file || !fs.existsSync(file)) fail(`interface.${key} (${file}) is missing`);
}
const versions = [".claude-plugin/plugin.json", ".cursor-plugin/plugin.json", ".grok-plugin/plugin.json"]
  .map((file) => [file, JSON.parse(fs.readFileSync(file, "utf8")).version]);
for (const [file, v] of versions) if (v !== manifest.version) fail(`${file} is ${v}, ${process.argv[2]} is ${manifest.version}`);
for (const dir of fs.readdirSync("skills")) {
  const file = path.join("skills", dir, "SKILL.md");
  const text = fs.readFileSync(file, "utf8");
  const front = /^---\nname: (.+)\ndescription: (.+)\n---\n/.exec(text);
  if (!front) fail(`${file} needs name and description frontmatter`);
  if (front[1] !== dir) fail(`${file} is named ${front[1]}, its folder ${dir}`);
  if (front[2].length > 1024) fail(`${file} description is over 1024 characters`);
  for (const [, link] of text.matchAll(/\]\((\.\.\/[^)]+)\)/g)) {
    if (!fs.existsSync(path.join("skills", dir, link))) fail(`${file} links to missing ${link}`);
  }
}
JS

mkdir -p dist
out="dist/daoco-chatgpt-$version.zip"
rm -f "$out"
zip -qr "$out" .codex-plugin .mcp.json skills assets README.md LICENSE -x '*.DS_Store'
echo "$out"
