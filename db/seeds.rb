# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者アカウント
Admin.create!(
	email: "admin@admin",
	password: "admin0",
	password_confirmation: "admin0")

# 会員アカウント
9.times do |n|
Member.create!(
	email: "member#{n+1}@member",
	last_name: "member#{n+1}",
	first_name: "member#{n+1}",
	last_name_kana: "member#{n+1}",
	first_name_kana: "member#{n+1}",
	postal_code: "1234567",
	address: "東京都渋谷区神宮前三丁目",
	phone_number: "09012345678",
	password: "members",
	password_confirmation: "members"
	)
end

# ジャンル
Genre.create!(
 [
	{
		name: "ケーキ",
		valid_invalid_status: 0
	},
	{
		name: "焼き菓子",
		valid_invalid_status: 0
	},
  {
    name: "キャンディー",
    valid_invalid_status: 0
  },
  {
    name: "プリン",
    valid_invalid_status: 0
  },
  {
    name: "アイス",
    valid_invalid_status: 0
  }
 ]
)



# 商品
Item.create!(
 [
	{
		genre_id: 1,
		item_name: "山葵のロールケーキ",
		explanation: "長野県産の山葵を生地とクリームに使ったロールケーキです。",
		unit_price_without_tax: 1000,
		sale_status: 0,
    image: open("./db/images/item_image1.jpg")
	},
	{
		genre_id: 1,
		item_name: "ショートケーキ",
		explanation: "長野県産のイチゴを使ったショートケーキです。",
		unit_price_without_tax: 1000,
		sale_status: 0,
    image: open("./db/images/item_image2.jpg")
	},
	{
		genre_id: 1,
		item_name: "チーズケーキ",
		explanation: "長野県産のそば粉とチーズに特製のそば茶クリームを混ぜて作ったチーズケーキです。",
		unit_price_without_tax: 1000,
		sale_status: 0,
    image: open("./db/images/item_image3.jpg")
	},
	{
		genre_id: 2,
		item_name: "山葵入りクッキー",
		explanation: "長野県安曇野市で採れた山葵を粉末にし生地に混ぜて作ったクッキーです。程よい甘しょっぱさでお酒のおつまみにもなります。",
		unit_price_without_tax: 1000,
		sale_status: 0,
    image: open("./db/images/item_image4.jpg")
	},
	{
		genre_id: 2,
		item_name: "そばクッキー",
		explanation: "長野県産のそば粉で作った甘さ控え目の和風クッキーです。",
		unit_price_without_tax: 1000,
		sale_status: 0,
    image: open("./db/images/item_image5.jpg")
	},
  {
    genre_id: 4,
    item_name: "キャラメルプリン",
    explanation: "国産の生クリームを煮詰めてつくったクリーミーで香ばしい生キャラメルの味わい。隠し味にフランスのロレーヌ産の岩塩を使って甘さを引き立たせた。素材選びにこだわってとろりとした食感を実現しているという。人工甘味料や保存料は使っていない。",
    unit_price_without_tax: 1000,
    sale_status: 0,
    image: open("./db/images/item_image6.jpg")
  },
  {
    genre_id: 1,
    item_name: "チョコレートケーキ",
    explanation: "しっとり甘いショコラスポンジに濃厚なチョコレートのクリームをサンド、底部にパリっと食感のチョコレートを塗った、チョコ好きに贈る贅沢な一品です。",
    unit_price_without_tax: 1000,
    sale_status: 0,
    image: open("./db/images/item_image7.jpg")
  },
  {
    genre_id: 3,
    item_name: "りんごキャンディー",
    explanation: "長野県産のりんごを使った飴です。",
    unit_price_without_tax: 500,
    sale_status: 0,
    image: open("./db/images/item_image8.jpg")
  },
  {
    genre_id: 3,
    item_name: "山葵キャンディー",
    explanation: "長野県安曇野市で採れた山葵を使った、刺激的なキャンディーです。",
    unit_price_without_tax: 1000,
    sale_status: 0,
    image: open("./db/images/item_image9.jpg")
  },
  {
    genre_id: 4,
    item_name: "山葵プリン",
    explanation: "山葵のツーンとした刺激が優しい甘みを引き立てます。",
    unit_price_without_tax: 800,
    sale_status: 0,
    image: open("./db/images/item_image10.jpg")
  },
  {
    genre_id: 5,
    item_name: "山葵アイス",
    explanation: "山葵のツーンとした刺激が優しい甘みを引き立てます。",
    unit_price_without_tax: 300,
    sale_status: 0,
    image: open("./db/images/item_image11.jpg")
  },
  {
    genre_id: 5,
    item_name: "りんごシャーベット",
    explanation: "信濃ゴールドを丸ごと一個つかった贅沢なシャーベットです。",
    unit_price_without_tax: 300,
    sale_status: 0,
    image: open("./db/images/item_image12.jpg")
  },
  {
    genre_id: 2,
    item_name: "アップルパイ",
    explanation: "アルプス乙女を使用したアップルパイ。リンゴが入った生地を先に焼き、その後にカスタードを入れて2度焼きすることで、なめらかなカスタードがたっぷり入ったアップルパイに仕上がっています。",
    unit_price_without_tax: 900,
    sale_status: 0,
    image: open("./db/images/item_image13.jpg")
  },
  {
    genre_id: 2,
    item_name: "アップルタルト",
    explanation: "アルプス乙女の甘酸っぱさと香ばしいアーモンドクリームがおいしいさくさくタルト。",
    unit_price_without_tax: 900,
    sale_status: 0,
    image: open("./db/images/item_image14.jpg")
  },
  {
    genre_id: 2,
    item_name: "そば粉のフィナンシェ",
    explanation: "そばの風味とバターのこくが癖になるフィナンシェです",
    unit_price_without_tax: 300,
    sale_status: 0,
    image: open("./db/images/item_image15.jpg")
  },
  {
    genre_id: 2,
    item_name: "そば粉のラスク",
    explanation: "一口ほおばるとほのかに香るそばの風味がなんともいえないラスクです・",
    unit_price_without_tax: 500,
    sale_status: 0,
    image: open("./db/images/item_image16.jpg")
  },
  {
    genre_id: 1,
    item_name: "リンゴのミルフィーユ風ムースケーキ",
    explanation: "さくさくパイ生地と滑らかカスタードムースに甘酸っぱい紅玉がマッチしたミルフィーユ風ムースケーキです。",
    unit_price_without_tax: 1000,
    sale_status: 0,
    image: open("./db/images/item_image17.jpg")
  },
  {
    genre_id: 4,
    item_name: "焼きプリン",
    explanation: "アイスクリームのような濃厚な口溶けと、香ばしく焦がしたキャラメルのほろ苦さが魅力の焼きプリンです。",
    unit_price_without_tax: 800,
    sale_status: 0,
    image: open("./db/images/item_image18.jpg")
  },
  {
    genre_id: 5,
    item_name: "お蕎麦ソフトクリーム",
    explanation: "バニラの甘さの後にそばの風味が香るソフトクリームです。",
    unit_price_without_tax: 300,
    sale_status: 0,
    image: open("./db/images/item_image19.jpg")
  },
  {
    genre_id: 3,
    item_name: "そば蜂蜜キャンディー",
    explanation: "香ばしい蕎麦の風味が蜂蜜の甘さを引き立てるキャンディです。",
    unit_price_without_tax: 500,
    sale_status: 0,
    image: open("./db/images/item_image20.jpg")
  }
 ]
)

#注文
9.times do |n|
Order.create!(
[
	{
	   member_id: "#{n+1}",
       postage: 800,
       payment_method: 0,
       address: "神奈川県横浜市中区山手町37",
       postal_code: 2318651,
       name: "東京都新宿区東新宿1丁目",
       total_fee: 1245677895,
       order_status: 0,
	},
]
)
end

# 注文履歴
OrderItem.create!(
[
	{
    order_id:1,
    item_id:1,
    items_tax_included_price: 50,
    number_of_items: 156,
    making_status: 0,
	},
	{
    order_id:1,
    item_id:1,
    items_tax_included_price: 150,
    number_of_items: 1560,
    making_status: 0,
	},
	{
    order_id:1,
    item_id:2,
    items_tax_included_price: 15022,
    number_of_items: 156550,
    making_status: 0,
	},
	{
    order_id:2,
    item_id:1,
    items_tax_included_price: 50,
    number_of_items: 156,
    making_status: 0,
	},
	{
    order_id:2,
    item_id:1,
    items_tax_included_price: 150,
    number_of_items: 1560,
    making_status: 0,
	},
	{
    order_id:2,
    item_id:2,
    items_tax_included_price: 15022,
    number_of_items: 156550,
    making_status: 0,
	}
]
)

# 配送先
Address.create!(
	[
		{
     name: "山田 菊",
     member_id: 1,
     shipping_address: "東京都新宿区東新宿5丁目",
     postal_code: 184587,
},
{
     name: "山田 百合",
     member_id: 2,
     shipping_address: "東京都新宿区東新宿9丁目",
     postal_code: 959597,
}
]
)
