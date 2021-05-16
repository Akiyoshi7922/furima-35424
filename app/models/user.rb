class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  MAIL_REGEX = /@.+/
  # deviceで用意されていますが勉強の為に記入しました！
  validates_format_of :password, with: PASSWORD_REGEX, message: "Include both letters and numbers"
  validates_format_of :email, with: MAIL_REGEX, message: "is invalid"
  with_options presence: true do
    validates :nick_name
    validates :birthday
    with_options format: { with: NAME_REGEX, message: "can't be blank" } do
      validates :last_name
    end
    with_options format: { with: NAME_REGEX, message: "can't be blank" } do
      validates :first_name
    end
    with_options format: { with: NAME_REGEX, message: "can't be blank" } do
      validates :last_name_kana
    end
    with_options format: { with: NAME_REGEX, message: "can't be blank" } do
      validates :first_name_kana
    end
  end
 end
