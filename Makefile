BOOKNAME=NewBook
DESTDIR=./_book/

all: html pdf

html:
	asciidoctor $(BOOKNAME).adoc -D $(DESTDIR)

pdf:
	asciidoctor-pdf -a scripts=cjk -a pdf-fontsdir=./fonts -a pdf-theme=./korean-theme.yml $(BOOKNAME).adoc -D $(DESTDIR)
	
readme:
	asciidoctor README.adoc -D $(DESTDIR)

font:
	mkdir -p fonts
	install-font.bat
	
clean:
	rm -rf $(DESTDIR)
