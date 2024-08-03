UID := $(shell id -u)
GID := $(shell id -g)
LANG := "en_CA.UTF-8"

# Define a rule to build all slides
slides: slides.html

# Define a pattern rule for building a slide
slides.html: slides.md theme.css
	docker run --rm --init -v "$(PWD)":/home/marp/app/ -e LANG=${LANG} -e MARP_USER="${UID}:${GID}" marpteam/marp-cli slides.md --theme-set theme.css --html --allow-local-files
