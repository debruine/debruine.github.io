library(tidyverse)

# convert r to z
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

min_n <- function(r1, r2, alpha = .05) {
  # assume ns are equal
  combos <- expand.grid(r1 = r1, r2 = r2, n1 = 5:5000)
  zp <- purrr::pmap_dfr(combos, ~comp_rs(..1, ..2, ..3) )
  
  combos %>%
    bind_cols(zp) %>% 
    mutate(
      sig = p < alpha,
      rdif = abs(r1 - r2) 
    ) %>%
    filter(sig == TRUE) %>%
    group_by(r1, r2, rdif) %>%
    summarise(min_n = min(n1))
}

theGrid <- min_n(seq(0,1, .05), seq(0,1, .05))

ggplot(theGrid) +
  geom_tile(aes(r1, r2, fill = log(min_n)), show.legend=F) +
  geom_text(aes(r1, r2, label=min_n), color = "white") +
  theme(legend.title = element_blank(),
      axis.text.x = element_text(angle=30,hjust=1,vjust=1.0),
      axis.text.y = element_text(size = 12))

ggsave("grid.png", width = 15, height = 15)

min_n(.2, .5)
