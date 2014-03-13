######################################################################
# Author: Michael Hoehle
# Date:   25 Feb 2006
#
# Comments: 
#Remove the tar file in the cygwin directory and use the one from Rtools
#watch the list in .Rbuildignore
######################################################################
RCMD = R CMD

install:
	cd LadyBug-3.0 ; make ladybug
	${RCMD} install .

binary:
#	perl-cygwin make.pl --binary
	R CMD build --force --no-vignettes .

manual:	
#	perl-cygwin make.pl --manual
	R CMD Rd2dvi --pdf -o RLadyBug.pdf .


