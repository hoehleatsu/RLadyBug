.onLoad <- function (libname, pkgname)
{
    # Colors for SEIR -- Use colors as suggested by the Ihaka paper
    color <- as.list(c(hcl(c(120,210,30),c=75,l=55), rgb(0.7,0.7,0.7)))
    names(color) <- c("S","E","I","R")
    options(epicolor = color)
    
    # The following condition is always FALSE, isn't it?
    # So we could remove this piece of code...
    if ( ! ( "path.sep" %in% names( .Platform ) ) ) {
        .Platform$path.sep <- ifelse( .Platform$OS.type == "unix", ":", ";" )
    }

    ## initialize options
    reset.RLadyBug.options()
    
    # Path to LadyBug
    RLadyBug.options(ladybugPath = file.path(libname, pkgname, "LadyBug"))
    
    # Path to the Hydra and LadyBug .JAR files (in the library dir)
    # Added lib.loc argument requested in e-mail by Kurt Hornik (11.09.2007)
    jar <- system.file("LadyBug", "bin", c("ladybug.jar", "hydra.jar"),
                       package = pkgname, lib.loc = libname)
    
    # The java option -Xrs "reduces the use of OS signals by Java/VM", see
    # `java -X`. This also prevents java from catching CRTL-C interruption
    # signals, which would otherwise cause R to quit.
    # But note: "Java parameters can only be used during JVM initialization
    # and other package may have intialized JVM already."
    options(java.parameters = c(getOption("java.parameters"), "-Xrs"))
    
    # Start the JVM
    .jpackage(pkgname, jars = NULL, morePaths = jar, nativeLibrary = FALSE,
              lib.loc = libname)
    
}


.onAttach <- function (libname, pkgname) {
  # Startup message
  vrs <- packageDescription(pkgname, lib.loc = libname, fields = "Version",
                            drop = TRUE)
  packageStartupMessage("This is ", pkgname, " ", vrs, ". ",
                        "For overview type ", sQuote(paste("?", pkgname, sep="")), ".")

  #Set the allExamples to FALSE if running with timings  
  allExamples <- if (interactive()) TRUE else {
    .withTimings <- Sys.getenv("_R_CHECK_TIMINGS_")
    withTimings <- !is.na(.withTimings) && nzchar(.withTimings)
    !withTimings
  }
  RLadyBug.options(allExamples = allExamples)

  #hoehle - manually check what happens if
  #R CMD check --as-cran is selected as opposite to
  #R CMD check --timings
  #!any(grepl("R_CHECK_TIMINGS", names(Sys.getenv())))
  #SYSTEM <- Sys.getenv()
  #save(file="foobar.RData",list=c("SYSTEM"))

}

