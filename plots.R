
library(tidyverse)
library(ggthemes)
library(readxl)

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
  scale_y_continuous(labels = scales::dollar)
