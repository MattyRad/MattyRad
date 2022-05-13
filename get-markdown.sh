#!/bin/bash

echo "\`\`\`" > README.md
echo "MattyRad" | figlet -f script >> README.md
echo "\`\`\`" >> README.md
echo -e '\n\n' >> README.md
echo -e '<table><tr><td valign="top">\n' >> README.md
echo -e "### Articles" >> README.md
curl --silent https://soapstone.mradford.com/rss.xml | xq -r '[..|objects|select(.title and .link) | select(.link | (contains("books") or contains("film")) | not)][1:][] | "[" +.title+ "](" +.link+ ")"' | xargs -I '{}' echo "- {}" >> README.md
echo -e '</td><td valign="top">\n' >> README.md
echo -e "### Book Reviews" >> README.md
curl --silent https://soapstone.mradford.com/rss.xml | xq -r '..|objects|select(.title and .link) | select(.link | contains("books")) | "[" +.title+ "](" +.link+ ")"' | xargs -I '{}' echo "- {}" >> README.md
echo -e '</td><td valign="top">\n' >> README.md
echo -e "### Film Reviews" >> README.md
curl --silent https://soapstone.mradford.com/rss.xml | xq -r '..|objects|select(.title and .link) | select(.link | contains("film")) | "[" +.title+ "](" +.link+ ")"' | xargs -I '{}' echo "- {}" >> README.md
echo -e '</td></tr></table>\n' >> README.md
