apply:
	(find dot-config -type d -maxdepth 1 | xargs -I @ mkdir -p "${HOME}/@") && stow -R --dotfiles .

remove:
	stow -D --dotfiles .

.PHONY: apply remove
