##@ Install
install: ## Install the plasmoid
	mkdir ~/.local/share/plasma/plasmoids/org.kde.plasma.tinyindicator
	cp -r ./metadata.json ~/.local/share/plasma/plasmoids/org.kde.plasma.tinyindicator/
	cp -r ./contents ~/.local/share/plasma/plasmoids/org.kde.plasma.tinyindicator/

update: ## Update the plasmoid
	cp -r ./metadata.json ~/.local/share/plasma/plasmoids/org.kde.plasma.tinyindicator/
	cp -r ./contents ~/.local/share/plasma/plasmoids/org.kde.plasma.tinyindicator/

wipe: ## Wipe the plasmoid
	rm -rf ~/.local/share/plasma/plasmoids/org.kde.plasma.tinyindicator

debug: ## Debug the plasmoid
	plasmoidviewer -a .

##@ Other
#------------------------------------------------------------------------------
help:  ## Display help
	@awk 'BEGIN {FS = ":.*##"; printf "Usage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
#------------- <https://suva.sh/posts/well-documented-makefiles> --------------

.DEFAULT_GOAL := help
.PHONY: help install
