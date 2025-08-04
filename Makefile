apply:
	(find dot-config -maxdepth 1 -type d | sed "s;^dot-;\.;" | xargs -I {} mkdir -p "${HOME}/{}") && stow -R --dotfiles --target=${HOME} .

remove:
	stow -D --dotfiles --target=${HOME} .

.PHONY: apply remove
