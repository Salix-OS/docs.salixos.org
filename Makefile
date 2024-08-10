SSH_HOST=salixos.org
SSH_PORT=22
SSH_USER=web
SSH_TARGET_DIR=/srv/www/docs

.PHONY: all
all: faq user dev packaging upgrading
	hugo-0.123.8

.PHONY: serve
serve: all
	hugo-0.123.8 serve

.PHONY: faq
faq:
	cat headers/faq.md > content/faq/_index.md
	grep -R "^title: " content/faq/*/_index.md |\
		sed "s|content/faq/\(.*\)/_index.md:title: \(.*\)|- [\2](/faq/\1)|" |\
		sed "s/\"//g" \
		>> content/faq/_index.md

.PHONY: user
user:
	cat headers/user.md > content/user/_index.md
	grep -R "^title: " content/user/*/_index.md |\
		sed "s|content/user/\(.*\)/_index.md:title: \(.*\)|- [\2](/user/\1)|" |\
		sed "s/\"//g" \
		>> content/user/_index.md

.PHONY: upgrading
upgrading:
	cat headers/upgrading.md > content/user/upgrading/_index.md
	find ./content/user/upgrading -type f -name "_index.md" | \
	grep -v "upgrading/_index.md" | \
	xargs grep "^title: " | \
	sed "s|\./content/user/upgrading/\(.*\)/_index.md:title: \(.*\)|- [\2](/user/upgrading/\1)|" | \
		sed "s/\"//g" | \
		tac \
		>> content/user/upgrading/_index.md

.PHONY: dev
dev:
	cat headers/dev.md > content/dev/_index.md
	find ./content/dev -type f -name "_index.md" | \
	grep -v "dev/_index.md" | \
	grep -v "/packaging/" | \
	xargs grep "^title: " | \
	sed "s|\./content/dev/\(.*\)/_index.md:title: \(.*\)|- [\2](/dev/\1)|" | \
		sed "s/\"//g" \
		>> content/dev/_index.md
	cat footers/dev.md >> content/dev/_index.md

.PHONY: packaging
packaging:
	cat headers/packaging.md > content/dev/packaging/_index.md
	find ./content/dev/packaging -type f -name "_index.md" | \
	grep -v "packaging/_index.md" | \
	xargs grep "^title: " | \
	sed "s|\./content/dev/packaging/\(.*\)/_index.md:title: \(.*\)|- [\2](/dev/packaging/\1)|" | \
		sed "s/\"//g" \
		>> content/dev/packaging/_index.md

.PHONY: upload
upload: all
	rsync -e "ssh -p $(SSH_PORT)" \
		-avz \
		--delete ./public/ $(SSH_USER)@$(SSH_HOST):$(SSH_TARGET_DIR)/

