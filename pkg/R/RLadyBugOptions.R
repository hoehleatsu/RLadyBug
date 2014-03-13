################################################################################
### Part of the RLadyBug package
##
###
### Description: Set up RLadyBug.options.
### The code below is copied from the construction of surveillance.options()
### by Sebastian Meyer in the R package 'surveillance' available under GPL-2.
###
### Copyright (C) 2013 Michael Höhle
### $Revision:: 230      $:  Revision of last commit
### $Author:: hoehle     $:  Author of last commit
### $Date:: 2013-02-22 0#$:  Date of last commit
################################################################################

.Options <- new.env()

.Options$ladybugPath <- list(
                              default=NA,  # maybe disabled by .onAttach()
                              check=function(x) is.character(x) && file.exists(x),
                              valid="a character string specifying the directoy containing the LadyBug jar file"
                              )

.Options$allExamples  <- list(
                         default=TRUE,  # maybe disabled by .onAttach()
                         check=function(x) is.logical(x) && length(x) == 1L,
                         valid="a single logical value"
                         )

## Function to activate the defaults
reset.RLadyBug.options <- function ()
{
    opts <- sapply(ls(.Options, all.names=TRUE), function (option) {
        .Options[[option]]$value <- .Options[[option]]$default
    }, simplify=FALSE, USE.NAMES=TRUE)
    invisible(opts)
}

## Internal function to query options
get.RLadyBug.options <- function (x, drop = TRUE)
{
    opts <- lapply(.Options, "[[", "value")
    if (drop && !missing(x) && length(x) == 1L) opts[[x]] else opts[x]
}

## Exported function to modify and query options
RLadyBug.options <- function (...) 
{
    knownOptions <- ls(.Options, all.names=TRUE)
    
    called <- list(...)
    if (length(called) == 0) return(get.RLadyBug.options())
    if (is.null(names(called)) && length(called)==1) {
      x <- called[[1]]
      if (is.null(x)) return(get.RLadyBug.options())
      if (is.list(x)) called <- x
    }
    
    if (is.null(names(called))) # case: RLadyBug.options("par1","par2",...)
    {
	ischar <- unlist(lapply(called, is.character))
	if(all(ischar)) {
          choices <- unlist(called)
          ok <- choices %in% knownOptions
          if(!all(ok)) stop("unrecognised option(s): ", called[!ok])
          return(get.RLadyBug.options(choices))
	} else {
	   wrong <- called[!ischar]
	   offending <- unlist(lapply(wrong, deparse, nlines=1,
                                      control="delayPromises"))
	   offending <- paste(offending, collapse=",")
           stop("unrecognised mode of argument(s) [", offending, "]:",
                "\n  should be character string or name=value pair")
    	}
    } else { # case: RLadyBug.options(name=value, name2=value2, ...)
        assignto <- names(called)
        if (!all(nzchar(assignto)))
            stop("options must all be identified by name=value")
        recog <- assignto %in% knownOptions
        if(!all(recog))
            stop("unrecognised option(s): ", assignto[!recog])
        
        ## validate and assign new values
        oldopts <- get.RLadyBug.options(assignto, drop=FALSE)
        for(i in seq_along(assignto)) {
            nama <- assignto[i]
            valo <- called[[i]]
            entry <- .Options[[nama]]
            if (!entry$check(valo))
                stop("option ", dQuote(nama), " should be ", entry$valid)
            .Options[[nama]]$value <- valo
        }
        
        ## done
        invisible(oldopts)
    }
}
