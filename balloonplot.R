library(tidyverse)
library(gplots)

dt <- read_csv("postpaid_subcat.csv")

dt %>%
  select(-predictions) -> dt_sel

dt_m <- as.matrix(dt_sel)
rownames(dt_m) <- dt$predictions

dt_table <- as.table(dt_m)

pdf("post_sub_balloon.pdf", width = 10, height = 10)
balloonplot(dt_table, xlab ="", ylab="", main = "", dotcolor = "forestgreen",
            label = FALSE, show.margins = F)
dev.off()
