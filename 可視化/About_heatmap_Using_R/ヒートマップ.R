#パッケージを読み込む
library("readxl")

#クロス集計表をデータフレームオブジェクトとして読み込む
ct <- read_excel("C:/R/可視化/クロス集計表.xlsx",
                 sheet = "Sheet1",
                 range = "H2:J8")
ct

library("tidyverse")

#三層：データ層＝ct,二層aes,三層geom_tile
#部署と性別集計後のヒートマップを書く
ggplot(data = ct) + 
  aes(x = 部署, y = 性別, fill =　件数) +
  geom_tile(color= "white")

#集計前のデータフレームを読み込む
df <- read_excel("C:/R/可視化/SCOPE2_元データ.xlsx",
                 sheet = "データ",
                 range = "B6:AL1476")
view(df)

#集計前のヒートマップを書く
#geom_bin_2dを使用
ggplot(data = df) +
  aes(x = 部署, y = 性別) +
  geom_bin_2d()

ggplot(data = df) +
  aes(x = 部署, y = 性別) +
  geom_bin_2d()　->g

g

view(layer_data(g))
