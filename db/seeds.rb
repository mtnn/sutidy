# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理者 データ
Admin.create!(
  email: 'root01@sutidy.com',
  password: 'root01',
  )

#会員 テストデータ
User.create!(
  email: 'user01@sutidy.com',
  password: 'user01',
  last_name: '須田',
  first_name: '三郎',
  last_name_kana: 'スダ',
  first_name_kana: 'サブロウ',
  gender: 0,
  age: 2,
  postal_code: '1230001',
  address: '東京都新宿区新宿4-1-9',
  is_deleted: 'false',
  )

User.create!(
  email: 'user02@sutidy.com',
  password: 'user02',
  last_name: '須藤',
  first_name: '加奈',
  last_name_kana: 'スドウ',
  first_name_kana: 'カナ',
  gender: 1,
  age: 3,
  postal_code: '1230002',
  address: '東京都豊島区西池袋1-17−10',
  is_deleted: 'false',
  )

User.create!(
  email: 'user03@sutidy.com',
  password: 'user03',
  last_name: '菅原',
  first_name: '翔',
  last_name_kana: 'スガワラ',
  first_name_kana: 'ショウ',
  gender: 0,
  age: 4,
  postal_code: '1230003',
  address: '東京都目黒区上目黒1-22-10',
  is_deleted: 'false',
  )

User.create!(
  email: 'user04@sutidy.com',
  password: 'user04',
  last_name: '杉田',
  first_name: '知恵',
  last_name_kana: 'スギタ',
  first_name_kana: 'チエ',
  gender: 1,
  age: 5,
  postal_code: '1230004',
  address: '東京都北区赤羽1-1-1',
  is_deleted: 'false',
  )

#サービスサービス テストデータ
Genre.create!(
  genre_name: '定期利用',
  )
Genre.create!(
  genre_name: 'コーチング',
  )
Genre.create!(
  genre_name: 'グルメ',
  )
Genre.create!(
  genre_name: 'アクセサリー',
  )

#clients テストデータ
Client.create!(
  user_id: 1,
  service_id: 1,
  )

Client.create!(
  user_id: 2,
  service_id: 2,
  )

Client.create!(
  user_id: 3,
  service_id: 3,
  )

#サブスクサービス テストデータ
Service.create!(
  client_id: 1,
  genre_id: 2,
  name: '変わりたいあなたへ！運動パーソナルトレーニング',
  description: 'ボディメイクに関する情報に関してメンターに質問し放題のサービス！運動メニューや食事管理等々、気になることを解決します！',
  price: 1500,
  is_stopped: 1,
  )

Service.create!(
  client_id: 2,
  genre_id: 4,
  name: '季節に合わせて使える！ハンドメイドアクセサリー「craft」',
  description: '四季折々の手作りアクセサリーを毎月お届けします。イヤリングやネックレスなど種類も様々なので、是非日頃手を出さないようなアクセサリーに出会うきっかけに！',
  price: 600,
  is_stopped: 1,
  )

Service.create!(
  client_id: 3,
  genre_id: 3,
  name: '毎月お届け！産地別 こだわり焙煎コーヒー',
  description: '「自分が飲んで本当に美味しいと思える珈琲を提供したい」その思いでこのサービスを始めました。世界中から選び抜いたコーヒー豆を自家焙煎し皆様の元へお送りします！',
  price: 1000,
  is_stopped: 1,
  )
