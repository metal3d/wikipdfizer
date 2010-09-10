# WikiPDF 

WikiPDF is a PHP script for command line. If you wonder why I used PHP, read below. The main goal is to generate a PDF file with syntax highlighted code, images, table of contents, etc... from a Simple Wiki Syntax.

# How to use it ?

## Installation
Get wikipdf script from this repository, or wait I make a release. Place this script in your PATH if you want the script to be easily invoked (for example, place it into /usr/local/bin directory)

Now try:
    $ wikipdf -h

This will show you some help on command usage.

## Usage
You may use wikipdf in several ways. It can use STDIN, STDOUT, or input file and output file. For example:

    $ wikidoc a_wiki_file.wiki -o pdf_file.pdf

This way, "a_wiki_file.wiki" will be parsed and "pdf_file.pdf" will be yield.

To use STDIN, just omit "input file":

    $ echo "=== Title ===\nHello you !" | wikipdf -o test.pdf

This will create a little pdf with this "hello" basic test.

And now:
    $ wikidoc test.wiki | gz > pdf_compressed.pdf.gz


# Why PHP ?

I wonder for a while which language to use to develop this kind of tool. I love Python, Perl, C... but PHP is probably the best choice to make for this job. 

I need to create HTML file, call bash commands and to create colored syntax code for many language support. There is a Library named Geshi that color scripts with a lot of nice options.

PHP has a good PCRE support (regular expression syntax from Perl). So, That's why I choosed PHP.