BOOKNAME=NewBook
DESTDIR=./_book/

all: html pdf readme

html:
	asciidoctor $(BOOKNAME).adoc -D $(DESTDIR)

pdf:
	asciidoctor-pdf -a scripts=cjk -a pdf-fontsdir=./fonts -a pdf-theme=./korean-theme.yml $(BOOKNAME).adoc -D $(DESTDIR)

test:
	asciidoctor TEST.adoc -D $(DESTDIR)

readme:
	asciidoctor README.adoc -D $(DESTDIR)

clean:
	rm -rf $(DESTDIR)

font:
	mkdir -p fonts
	install-font.bat

bundle:
	gem install rake
	gem install asciidoctor
	gem install asciidoctor-pdf
	gem install asciidoctor-pdf-cjk
	gem install asciidoctor-pdf-cjk-kai_gen_gothic
	gem install json
	gem install awesome_print
	gem install coderay
	gem install pygments.rb
	gem install thread_safe
	gem install epubcheck-ruby
	gem install html-proofer