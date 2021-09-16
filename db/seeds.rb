# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'root1@sutidy.com',
  password: 'root01',
  )

User.create!(
  email: 'user1@sutidy.com',
  password: 'user01',
  last_name: '須田',
  first_name: '三郎',
  last_name_kana: 'スダ',
  first_name_kana: 'サブロウ',
  gender: 0,
  age: 2,
  postal_code: '1234567',
  address: '東京都新宿区新宿4-1-9',
  is_deleted: 'false',
  )
  
Genre.create!(
  genre_name: 'コンサル',
  )

Service.create!(
  user_id: 1,
  genre_id: 1,
  name: '変わりたいあなたへ！運動パーソナルトレーニング',
  description: 'ボディメイクに関する情報に関してメンターに質問し放題のサービス！運動メニューや食事管理等々、気になることを解決します！',
  price: 1500,
  is_stopped: 1,
  )
