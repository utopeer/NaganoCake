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
	address: "1234567",
	phone_number: "110",
	password: "members",
	password_confirmation: "members"
	)
end

