## ----include = FALSE----------------------------------------------------------
library(fcirt)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.align = "center",
  fig.height = 4,
  fig.width = 6
)

## ----echo=FALSE---------------------------------------------------------------
# Response data
#>fcirt.Data <- c(1,2,2,1,1,1,1,1,NA,1,2,1,1,2,1,1,2,2,NA,2)
#>fcirt.Data <- matrix(fcirt.Data,nrow = 10)

## ----echo=FALSE---------------------------------------------------------------
# pairmap
#>pairmap <- c(1,3,5,7,2,4,6,8)
#>pairmap <- matrix(pairmap,ncol = 2)

## ----echo=FALSE---------------------------------------------------------------
# ind
#>ind <- c(1,2,1,2,1,2,2,1)

## ----echo=FALSE---------------------------------------------------------------
# ParInits
#>ParInits <- c(1, 1, 1, 1, 1, 1, 1, 1, 1, -1, 1, 1, 1, -1, 1, 1, -1, -1, -1, -1, -1, -1, -1, -1)
#>ParInits <- matrix(ParInits, ncol = 3)

## ----warning = FALSE----------------------------------------------------------
# Fit the MUPP model
#>mod <- fcirt(fcirt.Data=fcirt.Data, pairmap=pairmap, ind=ind, ParInits=ParInits, iter=100)
#>mod

## -----------------------------------------------------------------------------
# Extract theta estimates 
#>theta <- extract(x=mod, pars='theta')
# Turn theta estimates into p*trait matrix where p equals sample size and trait equals the number of latent traits
#>theta <- theta[,1]
# nrow=trait
#>theta <- matrix(theta, nrow=2)  
#>theta <- t(theta)
# theta estimates in p*trait matrix format
#>theta


# Extract tau estimates 
#>tau <- extract(x=mod, pars='tau')
#>tau <- tau[,1]
#>tau

## -----------------------------------------------------------------------------
# Obtain density plots for all alphas. 
#>bayesplot(x=mod, pars='alpha', plot='density', inc_warmup=FALSE)

## -----------------------------------------------------------------------------
# Obtain the trace plots for all alphas.
#>bayesplot(x=mod, pars='alpha', plot='trace', inc_warmup=FALSE)

## -----------------------------------------------------------------------------
# Obtain item information for item 1-3.
#>OII <- information(x=mod, approach="direct", information="item", items=1:3)
#>OII

## -----------------------------------------------------------------------------
# Obtain test information.
#>OTI <- information(x=mod, approach="direct", information="test")
#>OTI

