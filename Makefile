all: clean docc publish

docc:
	swift package --allow-writing-to-directory ./docs \
	generate-documentation --target DnDEngine \
	--disable-indexing \
	--transform-for-static-hosting \
	--hosting-base-path /DnDEngine \
	--output-path ./docs
clean:
	rm -Rf ./docs/*

preview:
	swift package --disable-sandbox preview-documentation --target DnDEngine

publish:
	git commit -m "Regenerated Documentation" ./docs
	git push
