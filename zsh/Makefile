OMZ_URL := https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
OMZ_DEST := oh-my-zsh.install.sh
OMZ_DIR := ~/.oh-my-zsh

.PHONY: install oh-my-zsh spaceship

install: oh-my-zsh

oh-my-zsh: $(OMZ_DEST)
	@echo "Running oh-my-zsh install script...";
	@sh "$(OMZ_DEST)" && \
		echo "Success!" || \
		echo "Installation failed :(" >&2;

$(OMZ_DEST):
	@echo "Downloading oh-my-zsh install script...";
	@if [ -e "$(OMZ_DEST)" ]; then \
		mv "$(OMZ_DEST)" "$(OMZ_DEST)~"; \
	fi;
	@curl -fsSL "$(OMZ_URL)" -o "$(OMZ_DEST)";
