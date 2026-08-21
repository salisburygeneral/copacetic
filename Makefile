export BUNDLE_ID TEAM_ID

PROJECT := App/Copacetic.xcodeproj

.PHONY: test build

test:
	swift test

build:
	@[ -n "$(BUNDLE_ID)" ] && [ -n "$(TEAM_ID)" ] \
	  || { echo "BUNDLE_ID and TEAM_ID must both be set"; exit 1; }
	xcodegen generate --spec App/project.yml
	@grep -q '$${' $(PROJECT)/project.pbxproj \
	  && { echo "$(PROJECT) has an unsubstituted variable"; exit 1; } || true
	xcodebuild build -project $(PROJECT) -scheme Copacetic \
	  -destination 'generic/platform=iOS Simulator'
