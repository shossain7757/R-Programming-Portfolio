library(tidyverse)
library(ggplot2)
library(gapminder)
ggplot(gapminder)+
  aes(x = gdpPercap, y = lifeExp)+
  geom_point(color = 'blue', alpha = .1)+
  scale_x_continuous(name = 'GDP Per Capita',
                     trans = 'log10',
                     labels = scales::dollar_format())+
  theme_bw()+
  ylab('Life Expectancy')



mauna <- tsibble::as_tsibble(co2) %>%
  rename(month = index, conc = value)


ggplot(mauna) +
  aes(x = month, y = conc)+
  geom_line() + 
  tsibble::scale_x_yearmonth()
  
  
# color in global aes and in geom point aes layer. 

ggplot(palmerpenguins::penguins)+
  aes(x = body_mass_g, y = bill_depth_mm, color = species)+
  geom_point()+
  geom_smooth(method = 'lm')


ggplot(palmerpenguins::penguins)+
  aes(x = body_mass_g, y = bill_depth_mm)+
  geom_point(aes(color = species))+
  geom_smooth(method = 'lm')



p <- ggplot(mauna) +
  aes(x = month, y = conc)+
  geom_line() + 
  tsibble::scale_x_yearmonth()


p +
  geom_smooth(color = 'darkgreen')


ggplot(gapminder) +
  geom_point(aes(x = gdpPercap, y = lifeExp), alpha = 0.1)


ggplot(cars) +
  geom_point(aes(x = speed, y = dist), color = "blue")

