library(tidyverse)

# convert r to z`
r2z <- function (r) {
  rplus <- r+1
  rminus <- 1-r
  zr <- (log(rplus)-log(rminus))/2
  
  zr
}

# plot relationship between r and z
r <- seq(0,.99,.01)
plot(r, r2z(r))

# compare independent r-values
comp_rs <- function(r1, r2, n1, n2=n1) {
  z1 <- r2z(r1)
  z2 <- r2z(r2)
  zd <- (z1 - z2) / sqrt( (1/(n1-3)) + (1/(n2-3)) )
  p <- 2*pnorm(-abs(zd))
  
  #print(paste0("Z(diff) = ", round(zd, 4), ", p(2-tailed) = ", round(p, 4)))
  
  list(z = zd, p = p)
}


sig_map <- function(r1, r2, n1, n2, alpha = .05) {
  combos <- expand.grid(r1 = r1, r2 = r2, n1 = n1, n2 = n2)
  zp <- purrr::pmap_dfr(combos, ~comp_rs(..1, ..2, ..3, ..4) )
  
  combos %>%
    bind_cols(zp) %>%
    ggplot(aes(n1, n2, fill = p < alpha)) +
    geom_tile(color = "black") +
    facet_grid(r1 ~ r2) +
    scale_fill_manual(values = c("grey", "red"))
  
}

# create a map 
r1 <- seq(.2, .3, .05)
r2 <- seq(.5, .6, .05)
n1 <- seq(10, 100, 10)
n2 <- seq(10, 100, 10)
sig_map(r1, r2, n1, n2)
