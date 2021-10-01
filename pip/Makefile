GH_API := https://raw.githubusercontent.com
VERS := 19
URPMS_REPO := UnitedRPMs/unitedrpms
FEDORA := $(shell rpm -E %fedora)

.PHONY: install URPM URPM_GPG URPM_RPM PIP2

install: PIP2 URPM

PIP2: URPM_RPM
	@sudo dnf install -y pip2

URPM: URPM_RPM URPM_GPG

URPM_GPG:
	@sudo rpm --import $(GH_API)/UnitedRPMs/unitedrpms/master/URPMS-GPG-PUBLICKEY-Fedora

URPM_RPM: URPM_GPG
	@sudo dnf -y install https://github.com/$(URPMS_REPO)/releases/download/$(VERS)/unitedrpms-$(FEDORA)-$(VERS).fc$(FEDORA).noarch.rpm
