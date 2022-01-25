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





