install_path = $(HOME)/.local/bin/gistdiff

.PHONY: install
install:
	cp gistdiff.sh $(install_path)
	chmod +x $(install_path)
