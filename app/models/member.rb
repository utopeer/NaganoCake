class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :cart_items
  has_many :addresses
  has_many :orders

  # enum設定
  enum withdrawal_status: { 有効: 0, 無効: 1 }

  # バリデーション
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, presence: true

  # 住所検索用 その他記述はhtmlとjavascripts/public/members.coffeeに記載
  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  # 退会
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end
