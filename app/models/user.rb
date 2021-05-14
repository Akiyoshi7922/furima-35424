class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: "Include both letters and numbers"
  validates :nick_name,               presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "Last name can't be blank" "First name can't be blank" } do
  validates :last_name,               presence: true
  validates :first_name,              presence: true
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "Last name can't be blank" "First name can't be blank" } do
  validates :last_name_kana,          presence: true
  validates :first_name_kana,         presence: true
  end
  validates :birthday,                presence: true
  end
# with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
#   validates :first_name
#   validates :last_name
# end
