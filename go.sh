#!/bin/bash
find . -not -path '*/.*' -name 'index.md' -execdir mv {} README.md \;
find . -not -path '*/.*' -name '*.md' -exec sed -i 's/index\.md/README.md/g' {} \;


