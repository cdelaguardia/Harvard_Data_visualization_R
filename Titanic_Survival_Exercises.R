options(digits = 3)    # report 3 significant digits
library(tidyverse)
library(titanic)

titanic <- titanic_train %>%
  select(Survived, Pclass, Sex, Age, SibSp, Parch, Fare) %>%
  mutate(Survived = factor(Survived),
         Pclass = factor(Pclass),
         Sex = factor(Sex))

ggplot(titanic, aes(x = Age, fill = Sex)) +
  geom_density(alpha = 0.5) +
  labs(x = "Age", y = "Density") +
  scale_fill_manual(values = c("blue", "pink")) +
  theme_minimal()

male <- titanic_train %>% filter(Sex == "male")
print(length(male$Sex))

female <- titanic_train %>% filter(Sex == "female")
print(length(female$Sex))

male_18_35 <- male %>% filter(Age >= 18 & Age <= 35)
male_prop_18_35 <- length(male_18_35$Sex)/length(male$Sex)
male_17 <- male %>% filter(Age < 17)
male_prop_17 <- length(male_17$Sex)/length(male$Sex)


female_18_35 <- female %>% filter(Age >= 18 & Age <= 35)
female_prop_18_35 <- length(female_18_35$Sex)/length(female$Sex)
female_17 <- female %>% filter(Age < 17)
female_prop_17 <- length(female_17$Sex)/length(female$Sex)

oldest_passenger <- titanic_train %>%
  filter(!is.na(Age)) %>%
  arrange(desc(Age)) %>%
  head(1)

oldest_passenger_sex <- oldest_passenger$Sex




