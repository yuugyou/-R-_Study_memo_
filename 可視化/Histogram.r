#パッケージを読み込む
library("readxl")
df <- read_excel(path = "C:/R/可視化/SCOPE2_元データ.xlsx",
                 sheet = "データ",
                 range = "B6:AL1476")

#全体の中身を確認
View(df)

#ggplotsを使用するため、パッケージを読み込む
library("tidyverse")

#Histogramを描く
ggplot(data=df) + 
  aes(x = 年齢)　+
  geom_histogram()

ggplot(data=df) + 
  aes(x = 年齢)　+
  geom_histogram()　-> Histogram

Histogram #日本語の場合、''が必要

#度数分布表を取り出す
layer_data(plot = Histogram)

layer_data(Histogram)

layer_data(Histogram) -> 度数分布表

view(度数分布表)

ggplot(data=df) + 
  aes(x = 年齢)　+
  geom_histogram(boundary= 0,
                 binwidth =5 ,
                 closed = "left")

#階級を設定
ggplot(data=df) + 
  aes(x = 年齢)　+
  geom_histogram(boundary= 0,
                 binwidth =5 ,
                 closed = "left") -> Histogram2
layer_data(Histogram2) -> 度数分布表２

view(度数分布表２)

ggplot(data=df) + 
  aes(x = 年齢)　+
  geom_histogram(boundary= 0,
                 binwidth =1 ,
                 closed = "left",
                 color="white") ->Histogram3

layer_data(Histogram3) ->度数分布表３
