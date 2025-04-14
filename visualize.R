if (!require(ggplot2)) install.packages("ggplot2")
if (!require(viridis)) install.packages("viridis")
if (!require(dplyr)) install.packages("dplyr")
if (!require(scales)) install.packages("scales")

library(ggplot2)
library(viridis)
library(dplyr)
library(scales)

set.seed(42)
data <- data.frame(
  age = runif(100, 20, 60),
  revenu = runif(100, 300, 1200),
  experience = runif(100, 1, 40)
)

points_annoter <- data %>% 
  filter(revenu > 1000 & age > 50)

ggplot(data, aes(x = age, y = revenu, color = experience)) +
  geom_point(size = 4, alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE, color = "black", size = 1.2) +
  geom_hline(yintercept = mean(data$revenu), linetype = "dashed", color = "purple", size = 1.2) +
  scale_color_viridis(option = "C", direction = 1) +
  scale_x_continuous(labels = scales::comma) +
  scale_y_continuous(labels = scales::comma) +
  theme_minimal(base_size = 16) +
  theme(
    axis.title = element_text(size = 18, face = "bold"),
    axis.text = element_text(size = 14),
    legend.title = element_text(size = 16),
    legend.text = element_text(size = 14),
    panel.grid.major = element_line(color = "gray90"),
    panel.grid.minor = element_blank(),
    strip.text = element_text(size = 14, face = "bold")
  ) +
  labs(
    title = "Relation entre l'Âge et le Revenu selon l'Expérience",
    subtitle = "Avec régression linéaire et annotations",
    x = "Âge (années)",
    y = "Revenu (en milliers)",
    caption = "Données simulées"
  )

