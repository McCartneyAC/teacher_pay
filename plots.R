library(tidyverse)
library(ggthemes)
read_excel <- function(header=TRUE,...) {
  read.table("clipboard",sep="\t",header=header,...)
}
states<-read_excel()
states<-as_tibble(states)
states
ggplot(states, aes(x=Actual.Pay, y = Adjusted.Pay)) + 
  geom_point(aes(color=factor(Strike))) +
  geom_smooth(color="orange") + 
  labs(
    title="Teacher Pay and Cost of Living by State",
    y = "Cost-of-Living Adjusted Pay",
    x = "Actual Pay",
    color = "Had Teacher 
Strike in 2018",
    caption = "Data via NPR"
  ) + 
  theme_gdocs()+
  scale_color_fivethirtyeight()
