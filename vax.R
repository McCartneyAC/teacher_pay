# code for the top-level graph comparing vaccination rates with state election outcomes: 

teacher_pay <- read_csv("https://raw.githubusercontent.com/McCartneyAC/teacher_pay/master/teacher_pay.csv")

library(estimatr)
teacher_pay %>% 
  mutate(winner = if_else(trump_electoral_2020>biden_electoral_2020, "Trump", "Biden")) %>% 
  ggplot(aes(x = pct_biden_2020, 
             y = vax_rate, 
             color = winner, 
             fill = winner, 
             size = population2018
             )) +
  geom_point(aes(alpha = pct_white_2012)) + 
  geom_smooth(method = "lm_robust", inherit.aes = FALSE, 
              aes(x = no_dc_biden, y = nodc_vax), 
              color = "black")+
  ggrepel::geom_text_repel(aes(pct_biden_2020, vax_rate, label = abbreviation), size = 2.5)+
  scale_color_manual(values = c( "navy", "red")) + 
  theme_typewriter() + 
  guides(size = FALSE, color = FALSE, fill = FALSE, alpha = FALSE) + 
  labs(title = "Vaccination rate is neatly predicted by Politics",
       subtitle = "States that voted more for Biden are also more fully vaccinated. \nThe interaction of race and politics is also a significant predictor.", 
       x = "Percent of state Voted for Biden",
       y = "                                                     Percent of Eligible Adults Vaccinated", 
       caption = "@wouldeye125") + 
  annotate("text", y= 0.545, x = 0.90, size =2.5,  color = "navy", label="linear model \nomits DC \noutlier") + 
  scale_x_continuous(labels = scales::percent)+ 
  scale_y_continuous(labels = scales::percent) + 
  annotate("text", y = .35, x = .7, color = "black", hjust = 0, 
           label = "Color = 2020 Victor \nsize =  population \nopacity = % white")

m1<-teacher_pay %>% 
  lm(vax_rate ~ pct_biden_2020, data = .)
m2<-teacher_pay %>% 
  lm(vax_rate ~ pct_white_2012, data = .)
m3<-teacher_pay %>% 
  lm(vax_rate ~ pct_biden_2020 + pct_white_2012, data = .)
m4<-teacher_pay %>% 
  lm(vax_rate ~ pct_biden_2020 + pct_biden_2020:pct_white_2012, data = .)

sjPlot::tab_model(m1, m2, m3, m4)

