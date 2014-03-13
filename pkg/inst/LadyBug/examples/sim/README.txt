This folder contains the data file for the simulation study of a 4x2
vaccination investigation mentioned in Section 4.3 "Application of
results to control measures" of of the Hoehle et. al article.

The files in the dir have been generated as follows:

#Generate the data -- i.e. generate the trajectories of an epidemic
#starting with an innoculation at time e0=0 in the 4x2 setup.
#The results are the foobar.all and the foobar.data files
../../bin/simsellke.sh 4x2.data traj e0

#Calculate MLE in the 4x2 setup and compare with the true
#values
../../bin/ladybug.sh foobar.data ml.sir

#Possibly analyze the epidemic in R, i.e. you have to generate
#the file foobar.all2 from the output after the statement
#"After genXYZ in sampleState() function..."
Rterm --vanilla < show.R
ghostview foobar.ps

#Now it would be nice to do the same with missing exposure times
#however there appears to be a bug in the programm here.