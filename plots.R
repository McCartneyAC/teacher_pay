
library(tidyverse)
library(ggthemes)
library(readxl)
library(magrittr)

states<-read_xlsx("data.xlsx")
states
ggplot(states, aes(x=`Actual Pay`, y = `Adjusted Pay`)) + 
  geom_text(aes(label=Abbreviation, color=factor(Strike))) +
  geom_smooth(method = "lm", color="orange", formula = y ~ splines::bs(x, 3)) + 
  labs(
    title="Teacher Pay and Cost of Living by State",
    y = "Cost-of-Living Adjusted Pay",
    x = "Actual Pay",
    color = "Had Teacher 
Strike in 2018",
    caption = "Data via NPR"
  ) + 
  theme_gdocs()+
  scale_color_fivethirtyeight()+
  scale_x_continuous(labels = scales::dollar)+
  scale_y_continuous(labels = scales::dollar) + 
  geom_abline(intercept = 0, slope =1)
##########

states %<>% 
  mutate(pct_trump = `Trump Votes`/(`Clinton Votes` + `Trump Votes`)) %>% 
  mutate(ratio_pay = `Adjusted Pay`/(`Actual Pay`))
states %>% 
  filter(Abbreviation !="DC") %>% 
  ggplot(aes(y=ratio_pay, x = pct_trump)) + 
  geom_text(aes(label=Abbreviation, color=factor(Strike))) +
  geom_smooth(method = "lm", color="orange") +
  scale_y_continuous(labels = scales::dollar) +
  labs(
    title="Teacher Pay and Politics by State",
    y = "Ratio - Adjusted Pay over Actual Pay",
    x = "Percent voted for Trump",
    color = "Had Teacher 
    Strike in 2018"
  ) + 
  theme_gdocs()+
  scale_color_fivethirtyeight()
