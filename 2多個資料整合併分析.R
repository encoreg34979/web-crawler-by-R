# 將多個分開的CSV檔合成一個
library(tidyverse)  # https://youtu.be/HpWce0ovphY 
fruit_price_data <- dir("download", full.names = TRUE) %>% map_df(read_csv)

library(dplyr)
result <- fruit_price_data %>%
  group_by(作物名稱) %>%
  summarise("上價平均" = mean(上價, na.rm = TRUE),  #把NA REMOVE 空值不算在內
            "中價平均" = mean(中價, na.rm = TRUE),
            "下價平均" = mean(下價, na.rm = TRUE),
            "總交易量" = sum(交易量, na.rm = TRUE)) %>%
  filter(上價平均 >= 200) %>%
  arrange(desc(總交易量))

