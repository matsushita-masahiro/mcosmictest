# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    UserType.destroy_all
    UserType.create(user_type:"1", type_name: "既存＆distributor", price:9000)
    UserType.create(user_type:"2", type_name: "新規&一般", price:10000)
    UserType.create(user_type:"3", type_name: "病人(5回券/月)", price:30000)
    UserType.create(user_type:"4", type_name: "既存＆distributorの回数券(11枚)", price:87000)
    UserType.create(user_type:"5", type_name: "新規&一般の回数券(11枚)", price:97000)
    UserType.create(user_type:"6", type_name: "代理店", price:9000)
    UserType.create(user_type:"7", type_name: "代理店の回数券(11枚)", price:9000)
    UserType.create(user_type:"8", type_name: "その他", price:9000)
    UserType.create(user_type:"9", type_name: "特別ユーザー", price:0)

