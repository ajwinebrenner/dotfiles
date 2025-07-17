apply:
	(find dot-config -type d -maxdepth 1 | sed "s;^dot-;\.;" | xargs -I {} mkdir -p "${HOME}/{}") && stow -R --dotfiles .

remove:
	stow -D --dotfiles .

.PHONY: apply remove
