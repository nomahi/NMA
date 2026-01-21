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

data(antidiabetic)
print(antidiabetic)




# 4. Setup: Transforming arm-level data to contrast-based summary statistics and making objects for the network meta-analysis

ad2 <- setup(study=id,trt=t,m=y,s=sd,n=n,measure="MD",ref="Placebo",data=antidiabetic)	
ad3 <- setup(study=id,trt=t,m=y,s=sd,n=n,measure="SMD",ref="Placebo",data=antidiabetic)

# The effect measure can be specified by "measure", and the reference treatment can be specified by "ref".



# 5. Creating a network plot

netplot(ad2)                                      # Network plot
netplot(ad2,base.lwd=1.5,base.cex=1.5)            # The edge widths and the node sizes can be changed.
netplot(ad2,col="red",bg="red")                   # The color can be changed.
netplot(ad2,text=FALSE)                           # The text can be cancelled.



# 6. Pairwise meta-analysis for all treatment pairs with direct comparisons

SumPMA(ad2)            # The pairwise meta-analyses are performed by "rma" and "regtest" functions of "metafor" package.



# 7. Network meta-analysis with the consistency model

nma(ad2) 




# 8. Creating ranking statistics for network meta-analysis (e.g., SUCRA)

nmarank(ad2)
nmarank(ad2, ascending=FALSE)                                 # The order can be inversed by "ascending".





# 9. Creating a league table

nmaleague(ad2)





# 10. Ranked forest plot

nmaforest(ad2, col.plot="blue")                               # The color can be changed.



		
		

# 11. Local inconsistency tests for all poissible closed loops (generalized Bucher's test)

local.ict(ad2)





# 12. Higgins' global inconsistency test based on the design-by-treatment interaction model

global.ict(ad2)





# 13. Q-statistic and its factorization

nmaQ(ad2)





# 14. Noma's side-splitting

sidesplit(ad2)





# 15. Jackson's random inconsistency model

random.icm(ad2)




# 16. Comparison-adjusted funnel plot

nmafunnel(ad2,legends="bottomright")		# Comparison-adjusted funnel plot for placebo-controlled trials





# 17. Contribution weight matrices

nmaweight(ad2)





# 18. Transforming summary-statistics data into arm-level data (can be "working" pseudo-data)

data(exdataMD)
print(exdataMD)

trans.armdata(study=id,treat1=treat1,treat2=treat2,n1=n1,n2=n2,y=MD,SE=seMD,measure="MD",data=exdataMD)

