#パッケージの読み込み
library("readxl")

#クロス集計表excelを読み込む
ct <- read_excel("C:/R/可視化/クロス集計表.xlsx",
                 sheet = "Sheet1",
                 range = "H2:J8")

ct #読み込まれた

library("tidyverse")

#棒グラフを描く
ggplot(data = ct) +
  aes(x = 部署, y = 件数) +
  geom_col() #pic1_女性と男性は区別されていない図が得られるが
#実際に1本の棒グラフではなく、下のコードを参照

#積み上げの棒グラフを描く
ggplot(data = ct) +
  aes(x = 部署, y = 件数, fill =性別) +
  geom_col(position = "stack") 　　#pic2_stack=積み上げの指示 

#横並びの棒グラフを描く
ggplot(data = ct) +
  aes(x = 部署, y = 件数, fill =性別) +
  geom_col(position = "dodge")　　#pic3_dodge=積み上げの指示 

#正規化の棒グラフを描く
ggplot(data = ct) +
  aes(x = 部署, y = 件数, fill =性別) +
  geom_col(position = "fill") 　　#pic4_fill=積み上げの指示 

#pic5_黒い棒グラフが1本の棒グラフではない
ggplot(data = ct) +
  aes(x = 部署, y = 件数) +
  geom_col(color="white") #真ん中線が出る

#pic6_性別に関する棒グラフを描く
ggplot(data = ct) +
  aes(x = 性別, y = 件数) +
  geom_col()

#pic7_性別の棒グラフの棒を部署で塗り分ける
ggplot(data = ct) +
  aes(x = 性別, y = 件数, fill = 部署) +
  geom_col(position = "stack")

#pic8_性別の棒グラフの棒を部署で塗り分けるbyDodge
ggplot(data = ct) +
  aes(x = 性別, y = 件数, fill = 部署) +
  geom_col(position = "dodge")

#pic9_性別の棒グラフの棒を部署で塗り分けるbyfill正規化
ggplot(data = ct) +
  aes(x = 性別, y = 件数, fill = 部署) +
  geom_col(position = "fill")

ct

#集計前のデータフレームを使用
df <- read_excel("C:/R/可視化/SCOPE2_元データ.xlsx",
                 sheet = "データ",
                 range = "B6:AL1476")
#全体像を確認
view(df)

#geom_barは自動集計機能を持つ
ggplot(data = df) +
  aes(x=部署) +
  geom_bar()　#p10-部署の棒グラフを描ける

#Todo:棒の中の男性と女性の内訳を知りたい
#positionの意味は並び方、stackの意味は積み上げ
ggplot(data = df) +
  aes(x=部署, fill = 性別) +
  geom_bar(position = "stack")　　#p11-積み上げ棒グラフができた

ggplot(data = df) +
  aes(x=部署, fill = 性別) +
  geom_bar(position = "dodge")　　#p12-横並びの棒グラフができた

ggplot(data = df) +
  aes(x=部署, fill = 性別) +
  geom_bar(position = "fill") #p13-正規化の棒グラフができた

ggplot(data = df) +
  aes(x=部署, fill = 性別) +
  geom_bar(position = "stack")　-> g  #数字で読みたい場合、集計表をとる

#layer_dataの全体像を確認
view(layer_data(g))

ggplot(data = df) +
  aes(x = 婚姻状況) +
  geom_bar()  #p14

ggplot(data = df) +
  aes(x = 婚姻状況, fill = `退職したか?`) +
  geom_bar(position = "dodge")  #p15

ggplot(data = df) +
  aes(x = 婚姻状況, fill = `退職したか?`) +
  geom_bar(position = "fill")  #p16

#具体的に棒グラフの高さを数字で読み取りたい場合
#レイヤーデータで集計表を取り出すとOK
ggplot(data = df) +
  aes(x = 婚姻状況, fill = `退職したか?`) +
  geom_bar(position = "fill") ->g

view(layer_data(g))

#年齢のヒストグラムを描く
ggplot(data =df) +
  aes(x = 年齢)　+
  geom_histogram()  #p17-デフォルトの階級の設定で書いた年齢のヒストグラム

#一本一本の棒を対象したかどうかで塗り分け-p17
ggplot(data =df) +
  aes(x = 年齢, fill=`退職したか?`)　+
  geom_histogram(position = "stack") #インサイトは読みにくい＆ガタガタ感あり

#一歳く切りのヒストグラムを描く-p18
ggplot(data =df) +
  aes(x = 年齢, fill=`退職したか?`)　+
  geom_histogram(position = "stack",
                 boundary = 0,
                 binwidth = 1,
                 closed ="left") #boundaryは基準点（0）,binwidthは階級幅
#closedのleftは、19-20の階級の場合、19は含まれる（20は無し）

ggplot(data =df) +
  aes(x = 年齢, fill=`退職したか?`)　+
  geom_histogram(position = "stack",
                 boundary = 0,
                 binwidth = 1,
                 closed ="left",
                 color = "white")       #枠線を追加-p19          

ggplot(data =df) +
  aes(x = 年齢, fill=`退職したか?`)　+
  geom_histogram(position = "stack",
                 boundary = 0,
                 binwidth = 1,
                 closed ="left",
                 color = "white") ->g

view(layer_data(g))

#年齢と在社年数の散布図を描-p20
ggplot(data =df) +
  aes(x = 年齢, y = 在社年数)　+
  geom_point()

#to-do:点の塗り分け-p21
ggplot(data =df) +
  aes(x = 年齢, y = 在社年数, fill=`退職したか?`)　+
  geom_point(shape="diamond filled")

#点の重なりを防止-p22
ggplot(data =df) +
  aes(x = 年齢, y = 在社年数, fill=`退職したか?`)　+
  geom_point(shape="diamond filled",
             position = "jitter")

ggplot(data =df) +
  aes(x = 年齢, y = 在社年数, fill=`退職したか?`)　+
  geom_point(shape="diamond filled",
             position = "jitter",
             alpha=0.25) #alpha透明度を変更-p23

ggplot(data =df) +
  aes(x = 年齢, y = 在社年数, fill=`退職したか?`)　+
  geom_point(shape="diamond filled",
             position = "jitter",
             alpha=0.25,
             color="white") #点の枠線の色を変更-p24

ggplot(data =df) +
  aes(x = 年齢, y = 在社年数, fill=部署)　+
  geom_point(shape="diamond filled",
             position = "jitter",
             alpha=0.25,
             color="white") #部署-p25

#役職と年齢の箱ひげ図を描く
ggplot(data =df) +
  aes(x = 役職, y=年齢) +
  geom_boxplot()  #p26-デフォルトの箱ひげ図

ggplot(data =df) +
  aes(x = 役職, y=年齢, fill=`退職したか?`) +
  geom_boxplot(position = "dodge")  #p27-退職者の塗り分け

ggplot(data =df) +
  aes(x = 役職, y=年齢, fill=`退職したか?`) +
  geom_boxplot(position = "dodge") ->g

view(layer_data(g)) #箱ひげ図の集計表を作成

#シンプルに年齢のヒストグラムを描く
ggplot(data = df) +
  aes(x=年齢) +
  geom_histogram()

ggplot(data = df) +
  aes(x=年齢, fill = `退職したか?`) +
  geom_histogram(position = "fill") #p28

ggplot(data = df) +
  aes(x=年齢, fill = `退職したか?`) +
  geom_histogram(position = "fill",
                 color="white") #p29-1本1本の棒が得られた

ggplot(data = df) +
  aes(x=年齢, fill = `退職したか?`) +
  geom_histogram(position = "fill",
                 color="white",
                 boundary = 0,
                 binwidth = 10,
                 closed = "left") #p30-10歳刻み
#注意：left設定ですが、60歳は50-60の階級に含まれる
#ggplotは一番右の階級は右端も含める
#改善の小技：boundaryを-0.001にする(49.999-59.999)

ggplot(data = df) +
  aes(x=年齢, fill = `退職したか?`) +
  geom_histogram(position = "fill",
                 color="white",
                 boundary = -0.001,
                 binwidth = 10,
                 closed = "left")  #p31-boundaryを-0.001にする(49.999-59.999)

#部署と婚姻状況を追加
ggplot(data = df) +
  facet_wrap(facets = ~部署+婚姻状況) +
  aes(x=年齢, fill = `退職したか?`) +
  geom_histogram(position = "fill",
                 color="white",
                 boundary = -0.001,
                 binwidth = 10,
                 closed = "left")  #p32

ggplot(data = df) +
  facet_wrap(facets = ~部署+婚姻状況) +
  aes(x=年齢, fill = `退職したか?`) +
  geom_histogram(position = "fill",
                 color="white",
                 boundary = -0.001,
                 binwidth = 10,
                 closed = "left") -> g

view(layer_data(g))
