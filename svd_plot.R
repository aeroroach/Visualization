library(readr)
library(dplyr)
library(ggplot2)

dt <- read_csv("/data01/pitchaym/CVM/data_svd.csv")

dt %>%
  select(wday_hour, C1:C5) %>% 
  gather(C1:C5, key= "group", value = "val") -> dt


dt %>%
  mutate(wday_hour = factor(wday_hour)) %>% 
  ggplot(aes(x = reorder(wday_hour, desc(wday_hour)), y = val, fill = group)) + 
  geom_bar(stat = "identity", position = position_dodge(width = 0.3)) + 
  geom_hline(yintercept=0) +
  coord_flip() +
  facet_grid(.~group) + 
  labs(x ="Day & Hour", y = "Values") +
  theme(text = element_text(size = 7), legend.position="none", 
        panel.spacing.x=unit(0.7, "lines"))

ggsave("data_svd.pdf", width = 25, height = 50, units = "cm")

voice <- read_csv("export/voice_svd.csv")

voice %>%
  gather(C1:C6, key= "group", value = "val") -> voice

voice %>% 
  mutate(wday_hour = factor(wday_hour)) %>% 
  ggplot(aes(x = reorder(wday_hour, desc(wday_hour)), y = val, fill = group)) + 
  geom_bar(stat = "identity", position = position_dodge(width = 0.3)) + 
  geom_hline(yintercept=0) +
  coord_flip() +
  facet_grid(.~group) + 
  labs(x ="Day & Hour", y = "Values") +
  theme(text = element_text(size = 7), legend.position="none", 
        panel.spacing.x=unit(0.7, "lines"))  

ggsave("export/voice_svd.pdf", width = 30, height = 50, units = "cm")