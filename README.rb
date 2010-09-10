=== WikiPDF ===

WikiPDF is a PHP script for command line. If you wonder why I used PHP, read below. The main goal is to generate a PDF file with syntax highlighted code, images, table of contents, etc... from a Simple Wiki Syntax.


=== Why PHP ? ===

I wonder for a while which language to use to develop this kind of tool. I love Python, Perl, C... but PHP is probably the best choice to make for this job. 

I need to create HTML file, call bash commands and to create colored syntax code for many language support. There is a Library named Geshi that color scripts with a lot of nice options.

PHP has a good PCRE support (regular expression syntax from Perl). So, That's why I choosed PHP.