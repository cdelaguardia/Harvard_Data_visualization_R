options(digits = 3)    # report 3 significant digits
library(tidyverse)
library(titanic)

titanic <- titanic_train %>%
  select(Survived, Pclass, Sex, Age, SibSp, Parch, Fare) %>%
  mutate(Survived = factor(Survived),
         Pclass = factor(Pclass),
         Sex = factor(Sex))
# Create the density plots
ggplot(titanic, aes(x = Age, fill = Sex)) +
  geom_density(alpha = 0.5) +
  labs(x = "Age", y = "Density") +
  scale_fill_manual(values = c("blue", "pink")) +
  theme_minimal()


# counting number of males
male <- titanic_train %>% filter(Sex == "male")
print(length(male$Sex))

# Counting number of females
female <- titanic_train %>% filter(Sex == "female")
print(length(female$Sex))

# Calculating male 18-35 proportion
male_18_35 <- male %>% filter(Age >= 18 & Age <= 35)
male_prop_18_35 <- length(male_18_35$Sex)/length(male$Sex)

# Calculating male under 17 proportion
male_17 <- male %>% filter(Age < 17)
male_prop_17 <- length(male_17$Sex)/length(male$Sex)

# Calculating female 18-35 proportion
female_18_35 <- female %>% filter(Age >= 18 & Age <= 35)
female_prop_18_35 <- length(female_18_35$Sex)/length(female$Sex)

# Calculating female under 17 proportion
female_17 <- female %>% filter(Age < 17)
female_prop_17 <- length(female_17$Sex)/length(female$Sex)


# Oldest passenger sex
oldest_passenger <- titanic_train %>%
  filter(!is.na(Age)) %>%
  arrange(desc(Age)) %>%
  head(1)

oldest_passenger_sex <- oldest_passenger$Sex

#QQ-plot of Age Distribution
params <- titanic %>%
  filter(!is.na(Age)) %>%
  summarize(mean = mean(Age), sd = sd(Age))

ggplot(titanic_test, aes(sample = Age)) +
  geom_qq(dparams = params)+geom_abline()

# Survival by Sex

titanic %>% ggplot(aes(x = Survived, fill = Sex)) +
  geom_bar(position = position_dodge()) +
  labs(title = "Survival by Sex", x = "Survived", y = "Count")

# Survival by Age
titanic |> ggplot(aes(x = Age, fill = Survived)) + 
  geom_density(alpha = 0.2) + 
  labs(title = "Density Plot of Age by Survival Status", x = "Age", y = "Count")

# Survival by Fare

titanic |> filter(Fare != 0) %>% ggplot(aes(Survived, Fare)) +
  geom_boxplot() + 
  labs(title = "Boxplot of Fare Grouped by Survival Status", x = "Survived", y = "Fare") +
  scale_y_continuous(trans = "log2") +
  geom_jitter(alpha = 0.4, width = 0.2, height = 0) +
  theme_bw()

