library(ggplot2)
library(dplyr)
library(ggrepel)

cats <- read.csv("https://gist.githubusercontent.com/currankelleher/5e7dd160a5f0e9d7a5d2e7f7ca0e8e99/raw/1a2d5b1151e64683c4966479f2c12b6d0664fe77/cat_breeds.csv")

cats <- cats %>%
  mutate(breed = reorder(breed, desc(weight_min)) %>% 
           factor(levels = unique(.)))

ggplot(cats, aes(x = breed, y = weight_min, color = coat_length)) +
  geom_point(size = 3, alpha = 0.6) +
  geom_text_repel(aes(label = breed), nudge_x = 0.5, direction = "y", hjust = 0) +
  scale_color_manual(values = c("#FF6347", "#3CB371")) +
  labs(title = "Poids minimum des races de chats",
       x = "Race",
       y = "Poids minimum (kg)",
       color = "Longueur du pelage") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))