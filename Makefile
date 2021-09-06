SUBDIRS := $(shell find -maxdepth 1 -mindepth 1 -type d -not -name ".git" -printf '%f ')
ENV := getenv.sh

.PHONY: install subdirs clean test $(SUBDIRS) $(ENV)
subdirs: $(SUBDIRS)
install: subdirs clean		# Don't want to list $(ENV) here as otherwise it will run twice
test: 
clean:


$(ENV):
	@echo "Running environment setup scripts..." >&2
	@./$@

$(SUBDIRS): $(ENV)
	$(MAKE) -C $@ install

# Additional dependencies can be declared in ordinary Make fashion here, e.g.:
# zsh: env

####################################

# SUBDIRS := $(wildcard */.)
# TARGETS := all clean
# 
# # foo/.all bar/.all foo/.clean bar/.clean
# SUBDIRS_TARGETS := \
# 	$(foreach t,$(TARGETS),$(addsuffix $t,$(SUBDIRS)))
# 
# .PHONY : $(TARGETS) $(SUBDIRS_TARGETS)
# 
# # static pattern rule, expands into:
# # all clean : % : foo/.% bar/.%
# $(TARGETS) : % : $(addsuffix %,$(SUBDIRS))
# 	@echo 'Done "$*" target'
# 
# # here, for foo/.all:
# #   $(@D) is foo
# #   $(@F) is .all, with leading period
# #   $(@F:.%=%) is just all
# $(SUBDIRS_TARGETS) :
# 	$(MAKE) -C $(@D) $(@F:.%=%)
