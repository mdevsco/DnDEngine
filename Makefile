docc:
	swift package --allow-writing-to-directory ./docs \
    generate-documentation --target DnDEngine \
    --disable-indexing \
    --transform-for-static-hosting \
    --hosting-base-path https://github.com/mdevsco/DnDEngine \
    --output-path ./docs
