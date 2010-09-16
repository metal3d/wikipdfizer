# WikiPDF 

WikiPDF is a PHP script for command line. If you wonder why I used PHP, read below. The main goal is to yield a PDF file with syntax highlighted code, images, table of contents, etc... from a Simple Wiki Syntax.

WikiPDF is not made to generate web wiki page to PDF. It's a tool to create documents (article, books) as LaTeX or DocBook can do, but with an easy syntax. For now, WikiPDF is in progress but it works properly.

Soon, you will be able to set document type, etc...

If you have any solution to create indexes reference, please contact me.

# Requirement

You need:

    * PHP 5.2+ (CLI only is needed, check php-cli package)
    * html2ps 
    * ps2pdf
    * convert (Imagemagik package)
    * iconv
    * php-geshi package installed in include_dir (see php.ini)
    * php-tidy module

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

    $ echo -e ":title Test\n=== Title ===\nHello you !\n" | wikipdf -o test.pdf

This will create a little pdf with this "hello" basic test.

Or nicer, use cat to generate on the fly a pdf:
    $ cat | wikipdf -o test.pdf 
    :title Test from command line
    
    = Usage =
    It's a simple usage of ''cat'' pipe to ''wikipdf'' command.
    Let's try some syntax Highlight:
    
    <code bash>
    #what we typed:
    cat | wikidoc
    </code>
    
    You can now press CTRL+D to generate what you've typed in shell :)

Let's take a look on test.pdf generated file.


And now:
    $ wikidoc test.wiki | gz > pdf_compressed.pdf.gz


# Wiki Syntax
You can use a pseudo Doku syntax. For now wikipdf recognizes this:

Headings:
     = H1 = 
     == H2 ==
    ...
    ===== H5 =====
    
Code:
    <code>
    some code here
    </code>

Syntax Higlighted code:
Be sure you have a blank line BEFORE code tag
    <code lang>
    lang attribute can be php, c, java... etc... See Geshi support
    some code here...
    </code>

Paragraphs are made by leaving a blank line between 2 text blocks.

Add Image:
    {{path/to/image}}

Add Image with resize:
    {{path/to/image?50%}}
    {{path/to/image?240x45}}

In paragraphs, you can use:
    **to bold text**
    //emphasis text//
    ''verbatim code''
    __underline text__


Import file to split your document, you must set it in on line per document:
    =>filename1
    =>filename2
    =>...


# Options
You may add options at top of your file. Each option is on a new line, begining with ":". Take care to not set blank line between options !

Example:
    :title Title of my document
    :author Patrice Ferlet <metal3d@gmail.com>

Use these:
    :title set title 
    :footer right/center/left => replace right, center and left by: 
                                                D to have date, T to have title, A to have author
                                                H to have current Headinf, N to have page number
    Example:
    :footer H//N => this set Heading to the left, page number to the right, nothing at center.
    :header left/center/right => same as header
    :alternate: 0 => page are not alternated (no reverse left and right header and footer on odd and even pages)
    :toctitle Set table of contents title other than "Table of contents"
    :paper-type Format, default is A4
    :orientation portrait or landscape
    :font FontName => for example Helvetica
    :font-size Xpt => where X is size in points (12pt)
    :text-align alignement => justify, left, right

# Why PHP ?

I wonder for a while which language to use to develop this kind of tool. I love Python, Perl, C... but PHP is probably the best choice to make for this job. 

I need to create HTML file, call bash commands and to create colored syntax code for many language support. There is a Library named Geshi that can create highlighted color code source with a lot of nice options. It's a better choice than "highlighter" command line tool that haven't options I needed.

PHP has a good PCRE support (regular expression syntax from Perl). That's why I choosed PHP.
