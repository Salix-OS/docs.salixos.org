
.PHONY: all
all: faq user dev
	hugo-0.111.3

.PHONY: serve
serve: all
	hugo-0.111.3 serve

.PHONY: faq
faq:
	cat headers/faq.md > content/faq/_index.md
	grep -R "^title: " content/faq/[[:alnum:]]*.md |\
		sed "s|content/faq/\(.*\).md:title: \(.*\)|- [\2](/faq/\1)|" |\
		sed "s/\"//g" \
		>> content/faq/_index.md

.PHONY: user
user:
	cat headers/user.md > content/user/_index.md
	grep -R "^title: " content/user/[[:alnum:]]*.md |\
		sed "s|content/user/\(.*\).md:title: \(.*\)|- [\2](/user/\1)|" |\
		sed "s/\"//g" \
		>> content/user/_index.md

.PHONY: dev
dev:
	cat headers/dev.md > content/dev/_index.md
	grep -R "^title: " content/dev/ |\
		grep -v "_index.md" |\
		sed "s|content/dev/\(.*\).md:title: \(.*\)|- [\2](/dev/\1)|" |\
		sed "s/\"//g" \
		>> content/dev/_index.md
