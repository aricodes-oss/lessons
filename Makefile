clean:
	find . -type f -iname '*.html' -delete
	rm -rf out

docs: clean
	mkdir -p out
	find . -type f -iname '*.org' -exec org-export html --infile {} \;
