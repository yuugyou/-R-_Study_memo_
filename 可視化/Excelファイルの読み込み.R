.libPaths()
.libPaths()
library("readxl")
read_excel
df <- read_excel(path = "C:/R/可視化/SCOPE2_元データ.xlsx",
           sheet = "データ",
           range = "B6:AL1476")
df
View(df)
df$年齢
df$`退職したか?`
df$`日給レート ($)`
df$`ワークライフバランス\r\nアンケート結果`
df$`自宅から職場までの距離 (km)`
