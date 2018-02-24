HOME ?= `$HOME`
PWD ?= `pwd`

.PHONY: provision
provision: bashfiles setup-git-config

.PHONY: bashfiles
bashfiles:
	@echo '##'
	@echo '# Symlink the dot files in'
	@echo '##'
	for file in  \
	.bash_aliases \
	.bash_functions \
	.bash_profile \
	.bash_docker \
	.bash_vagrant \
	.bash_git \
	.exports \
	.gitconfig \
	.gitignore \
	.vimrc \
	.curlrc \
	.inputrc \
	.tmux.conf \
	; \
	do \
		echo $$file; \
		ln -sf $(PWD)/$$file $(HOME)/$$file; \
	done

.PHONY: setup-git-config
setup-git-config:
	@echo '##'
	@echo '# Setup the local git configuration'
	@echo '##'
ifeq ("$(wildcard $(HOME)/.gitconfig.local)","")
	cp .gitconfig.local $(HOME)/.gitconfig.local
	@echo "Enter your full name";
	@read -e name; \
	sed -i '' "s/GITNAME/$$name/" $(HOME)/.gitconfig.local
	@echo "Enter your email address";
	@read -e email; \
	sed -i '' "s/GITEMAIL/$$email/g" $(HOME)/.gitconfig.local
endif
