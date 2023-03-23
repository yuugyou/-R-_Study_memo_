#パッケージを読み込む
library("readxl")
df <- read_excel(path = "C:/R/可視化/SCOPE2_元データ.xlsx",
                 sheet = "データ",
                 range = "B6:AL1476")

View(df)
library("tidyverse")

#ggplotは3層の重ね合わせ
#箱ひげ図を描く
ggplot(data = df) +
  aes(x=役職, y=年齢)　+
  geom_boxplot()

#集計表を取り出す
ggplot(data = df) +
  aes(x=役職, y=年齢)　+
  geom_boxplot()　->箱ひげ図

layer_data(箱ひげ図)　->　集計表

view(集計表)

