#!/bin/bash

echo -e 'Yo\n\n' > README.md
echo -e '<table><tr><td valign="top">\n' >> README.md
echo -e "### Articles" >> README.md
curl --silent https://soapstone.mradford.com/rss.xml | xq -r '[..|objects|select(.title and .link)] | map("["+ .title + "](" + .link + ")") | .[]' | xargs -I '{}' echo "- {}" >> README.md
echo -e '</td><td valign="top">\n' >> README.md
echo -e "### Book Reviews" >> README.md
curl --silent https://books.mradford.com/rss.xml | xq -r '[..|objects|select(.title and .link)] | map("["+ .title + "](" + .link + ")") | .[]' | xargs -I '{}' echo "- {}" >> README.md
echo -e '</td><td valign="top">\n' >> README.md
echo -e "### Film Reviews" >> README.md
curl --silent https://film.mradford.com/rss.xml | xq -r '[..|objects|select(.title and .link)] | map("["+ .title + "](" + .link + ")") | .[]' | xargs -I '{}' echo "- {}" >> README.md
echo -e '</td></tr></table>\n' >> README.md
