#excelファイルの読み込み
library("readxl")
df <- read_excel(path = "C:/R/可視化/SCOPE2_元データ.xlsx",
                 sheet = "データ",
                 range = "B6:AL1476")
View(df)

str(df)

library("tidyverse")
ggplot
ggplot(data = df)
aes
#散布図を作成
ggplot(data = df) + aes(x=年齢, y=在社年数) + geom_point()
