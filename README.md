# Flex & Bison - Unix Text processing Tools

The book [Flex & Bison][1] (IBAN 978-0-596-15597-1) released on August 2009 by [O'Reilly][2] written by John Levine contains
a lot of code examples. On the preface, page xv, the book prints the following URL

    ftp://ftp.iecc.com/pub/file/flexbison.zip

from which you can download the examples from this book. The link (as of Sep. 2019) is still online
and you can still download the zip file.

Executing `make` does indeed compile many examples, however (I'm using GCC 8.3.0 on Gentoo Linux) most of them
compile with warnings and at some point it simply stops with a compile error. Inspecting the source code reveals
that many examples are simply outdated, specially the C code.

Wanting to refresh my knowledge about these two tools, I decided to go through the whole book again and
rewrite the code examples one by one. I'll update the outdated C code and use C99 instead. I'll also try
to fix any flex/bison code that does not compile with modern version of these tools.
I'll be using flex-2.6.4 (the book uses flex-2.5.35) and bison-3.1 (the book uses bison-2.4.1).

## Copyright

I am neither the author of the book nor the author of the examples. I also don't own the copyright of the
book. I simply bought a physical copy of this book.

I decided to put the revised versions on github because the original files are (still) publicly available.


[1]: http://shop.oreilly.com/product/9780596155988.do
[2]: http://shop.oreilly.com/
