Author: Michael Höhle <hoehle@stat.uni-muenchen.de>
Date:   7 April 2004

Depending on whether you download just the jar or the full version
this folder contains the following files.

Note that I work on a Windows box using Cygwin (http://www.cygwin.com)
Some of the shell scripts provided might not work in a pure Unix
environment and will definitely not work on a Windows box without
cygwin. You can use .bat files instead, but you have to write these
yourself or call java manually each time.


See LICENSE.txt for the GPL distribution of this software. 

Disclaimer:

All use is at own risk and no warranties are given. The software is
provided by a motivation of "I got nothing to hide" and "this might be
useful to someone else". This is in NO WAY a user friendly bug free
general purpose tool. If you in a creative moment want to test the
program on your own datasets be careful: no testing except for the
datasets in the examples/ directory has been done - you probably end
up looking at java exceptions. If you at this point still are
optimistic have a look at the source or contact me to investigate
what can be done to make the program work for your dataset.

Happy ladyBugging!


--- jar distribution -----------------------------------------------

bin	    JAR files of the LadyBug 2.0 package (sir.*) and the Hydra
	    library. If all you want to do is try out the program
	    use the bin/ladybug.sh script on the data/specification files
	    located in the examples directory. 

examples    Directory containing datasets to test the LadyBug program.
	    For example the classical swine fever virus dataset
	    analyzed by "Inference in disease transmission experiments using
	    stochastic epidemic models", M. Höhle, E. Jørgensen, and 
	    P.D. O'Neill, 19 pages, 2004 (In revision for Applied Statistics)
	    or the data in the P.D. O'Neill and G. O. Roberts paper
	    "Bayesian inference for partially observed stochastic epidemics", 
	    J.R.S.S.A. 162, 121-129.

--- source distribution contains these additional folders -------

src	    Java Source files for the JBuilder9 LadyBug project (ladybug.jpx)
	    A package sir is defined (the name "sir" is a product of historical
	    reasons)

doc	    JavaDoc documentation for the sir package

hydra	    Source for the Hydra package. Large stack of files provided
	    in case you ever want to fiddle with it you are on your own
	    here!




News:
* 7 April 2004. Version 2.0 including source is now available.
