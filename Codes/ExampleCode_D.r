# "NMA: Network meta-analysis based on multivariate meta-analysis and meta-regression models in R"
#  by Hisashi Noma, Kazushi Maruo, Shiro Tanaka and Toshi A. Furukawa
#
#  September 16, 2025
###


# 1. Install the package from CRAN (require R >= 3.5.0)

install.packages("NMA")



# 2. Load the "NMA" package

library("NMA")            # load the "NMA" package



# 3. Load the illustrative example

data(exdataP)
print(exdataP)

woods4 <- trans.armdataP(study=study,treat=trt,y=y,SE=se,data=exdataP)

print(woods4)		# "working" pseudo-data




# 4. Setup: Transforming arm-level data to contrast-based summary statistics and making objects for the network meta-analysis

wd4 <- setup(study=study,trt=trt,d=d,n=n,measure="SPD",ref="Placebo",data=woods4)
wd5 <- setup(study=study,trt=trt,d=d,n=n,measure="HR",ref="Placebo",data=woods4)

# The effect measure can be specified by "measure", and the reference treatment can be specified by "ref".




# 5. Creating a network plot

netplot(wd4)                                      # Network plot
netplot(wd4,base.lwd=1.5,base.cex=1.5)            # The edge widths and the node sizes can be changed.
netplot(wd4,col="red",bg="red")                   # The color can be changed.
netplot(wd4,text=FALSE)                           # The text can be cancelled.



# 6. Pairwise meta-analysis for all treatment pairs with direct comparisons

SumPMA(wd4)            # The pairwise meta-analyses are performed by "rma" and "regtest" functions of "metafor" package.



# 7. Network meta-analysis with the consistency model

nma(wd4)				# Survival probability difference
nma(wd5,eform=TRUE)		# Hazard ratio




# 8. Creating ranking statistics for network meta-analysis (e.g., SUCRA)

nmarank(wd4)
nmarank(wd4, ascending=FALSE)                                 # The order can be inversed by "ascending".





# 9. Creating a league table

nmaleague(wd4,eform=TRUE)





# 10. Ranked forest plot

nmaforest(wd4, col.plot="blue")                               # The color can be changed.



		
		

# 11. Local inconsistency tests for all poissible closed loops (generalized Bucher's test)

local.ict(wd4)





# 12. Higgins' global inconsistency test based on the design-by-treatment interaction model

global.ict(wd4)





# 13. Q-statistic and its factorization

nmaQ(wd4)





# 14. Noma's side-splitting

sidesplit(wd4)





# 15. Jackson's random inconsistency model

random.icm(wd4)




# 16. Comparison-adjusted funnel plot

nmafunnel(wd4,legends="bottomright")		# Comparison-adjusted funnel plot for placebo-controlled trials





# 17. Contribution weight matrices

nmaweight(wd4)





