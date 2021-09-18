FNAME = iwlwifi-reset
SOURCE = ./$(FNAME).sh
DEST = /lib/systemd/system-sleep/$(FNAME)

install:
	@echo "Symlinking $(SOURCE) to $(DEST)..."
	@sudo ln -s "$(shell realpath $(SOURCE))" "$(DEST)"
	@[ $$? -eq 0 ] && echo "Success!" || echo "Symlink failed." >&2
