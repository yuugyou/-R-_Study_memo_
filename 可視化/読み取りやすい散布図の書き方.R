#excelファイルの読み込み
library("readxl")
df <- read_excel(path = "C:/R/可視化/SCOPE2_元データ.xlsx",
                 sheet = "データ",
                 range = "B6:AL1476")
View(df)
str(df)
#パッケージを読み込む
library("tidyverse")
ggplot
ggplot(data = df)
aes　

#散布図を作成
ggplot(data = df) + aes(x=年齢, y=在社年数) + geom_point()

#散布図の形を変更(正方形)
ggplot(data = df) + aes(x=年齢, y=在社年数) + geom_point(shape="square filled")

#散布図の形を変更（サイズ）
ggplot(data = df) + aes(x=年齢, y=在社年数) + geom_point(shape="square filled",
                                                   size=2)
#散布図の形を変更（カラー）
#ネット上”R color”を検索、自分が好きなカラーは選べる
ggplot(data = df) + aes(x=年齢, y=在社年数) + geom_point(shape="square filled",
                                                   size=2,color="mediumspringgreen")

#散布図の形を変更（枠線の太さ）
ggplot(data = df) + aes(x=年齢, y=在社年数) + geom_point(shape="square filled",
                                                   size=2,color="mediumspringgreen",
                                                   stroke=1)

#散布図の形を変更（点の塗りつぶしの色）
ggplot(data = df) + aes(x=年齢, y=在社年数) + geom_point(shape="square filled",
                                                   size=2,color="mediumspringgreen",
                                                   stroke=1,
                                                   fill="mediumslateblue")

#散布図の形を変更（透明度）
#透明度(alpha)変更により点の重なり具合が違うことがわかった
ggplot(data = df) + aes(x=年齢, y=在社年数) + geom_point(shape="square filled",
                                                   size=2,color="mediumspringgreen",
                                                   stroke=1,
                                                   fill="mediumslateblue",
                                                   alpha=0.1)

#わざと点をずらす(jitter)
#ちょっとずれた結果は滑らかに見える
#より点の重なり具合どの辺多いのかはわかる
ggplot(data = df) + aes(x=年齢, y=在社年数) + geom_point(shape="square filled",
                                                   size=2,color="mediumspringgreen",
                                                   stroke=1,
                                                   fill="mediumslateblue",
                                                   alpha=0.1,
                                                   position = "jitter")
#上記の操作はより読み取りやすい散布図の書き方