options(digits = 3)    # report 3 significant digits
library(tidyverse)
library(titanic)

titanic <- titanic_train %>%
  select(Survived, Pclass, Sex, Age, SibSp, Parch, Fare) %>%
  mutate(Survived = factor(Survived),
         Pclass = factor(Pclass),
         Sex = factor(Sex))
#Create the density plots
ggplot(titanic, aes(x = Age, fill = Sex)) +
  geom_density(alpha = 0.5) +
  labs(x = "Age", y = "Density") +
  scale_fill_manual(values = c("blue", "pink")) +
  theme_minimal()


#counting number of males
male <- titanic_train %>% filter(Sex == "male")
print(length(male$Sex))

#Counting number of females
female <- titanic_train %>% filter(Sex == "female")
print(length(female$Sex))

#Calculating male 18-35 proportion
male_18_35 <- male %>% filter(Age >= 18 & Age <= 35)
male_prop_18_35 <- length(male_18_35$Sex)/length(male$Sex)

#Calculating male under 17 proportion
male_17 <- male %>% filter(Age < 17)
male_prop_17 <- length(male_17$Sex)/length(male$Sex)

#Calculating female 18-35 proportion
female_18_35 <- female %>% filter(Age >= 18 & Age <= 35)
female_prop_18_35 <- length(female_18_35$Sex)/length(female$Sex)

#Calculating female under 17 proportion
female_17 <- female %>% filter(Age < 17)
female_prop_17 <- length(female_17$Sex)/length(female$Sex)


#Oldes passenger sex
oldest_passenger <- titanic_train %>%
  filter(!is.na(Age)) %>%
  arrange(desc(Age)) %>%
  head(1)

oldest_passenger_sex <- oldest_passenger$Sex




