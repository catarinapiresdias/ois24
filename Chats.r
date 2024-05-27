# Installer et charger les packages nécessaires
if (!require("ggplot2")) install.packages("ggplot2", dependencies=TRUE)
if (!require("dplyr")) install.packages("dplyr", dependencies=TRUE)
library(ggplot2)
library(dplyr)

# Exemples de données sur les races de chats
cat_data <- data.frame(
  Breed = c("Siamese", "Persian", "Maine Coon", "Ragdoll", "Bengal"),
  Weight = c(10, 12, 15, 20, 18),
  Lifespan = c(15, 14, 12, 15, 16),
  Popularity = c(4, 3, 5, 2, 1)
)

# Visualisation avancée : un graphique à bulles avec ggplot2
ggplot(cat_data, aes(x = Weight, y = Lifespan, size = Popularity, color = Breed)) +
  geom_point(alpha = 0.6) +
  scale_size_continuous(range = c(5, 15)) +
  labs(title = "Cat Breeds: Weight vs Lifespan",
       x = "Average Weight (lbs)",
       y = "Average Lifespan (years)",
       size = "Popularity",
       color = "Breed") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))