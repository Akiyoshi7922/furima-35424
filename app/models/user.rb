class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :item
  has_many :order

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  NAME_REGEX2 =/\A[ァ-ヶー]+\z/
  MAIL_REGEX = /@.+/
  # deviceで用意されていますが勉強の為に記入しました！
  validates_format_of :password, with: PASSWORD_REGEX, message: "Include both letters and numbers"
  validates_format_of :email, with: MAIL_REGEX, message: "is invalid"
  with_options presence: true do
    validates :nick_name
    validates :birthday
    with_options format: { with: NAME_REGEX, message: "is invalid. Input full-width characters." } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: NAME_REGEX2, message: "is invalid. Input full-width katakana characters." } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
 end
