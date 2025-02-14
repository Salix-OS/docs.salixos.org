SSH_HOST=salixos.org
SSH_PORT=22
SSH_USER=web
SSH_TARGET_DIR=/srv/www/docs

.PHONY: build
build: faq user dev packaging upgrading
	rm -rf public
	mkdir public
	git worktree prune
	rm -rf .git/worktrees/public/
	git worktree add -B master public origin/master
	rm -rf public/*
	hugo-0.123.8
	cp README.md public/
	cd public && \
	rm -f index.xml && \
	ln -s post/index.xml index.xml

.PHONY: serve
serve: build
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
upload: build
	rsync -e "ssh -p $(SSH_PORT)" \
		-avz \
		--delete ./public/ $(SSH_USER)@$(SSH_HOST):$(SSH_TARGET_DIR)/

.PHONY: publish
publish: build
	cd public && \
	git add --all && \
	git commit -m "Publish on `LANG=C.utf8 date`" && \
	git push -u origin master

.PHONY: update-theme
update-theme:
	git submodule update --remote themes/even
