require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe "ユーザー新規登録" do

  context '正常系' do
    it 'passwordが6文字以上であれば登録できること' do
      expect(@user).to be_valid
    end
    it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end




  context '異常系' do
    it "nicknameが空だと登録できない" do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end

  end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@を含む必要があること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end
    it 'password:半角英数混合(半角英語のみ)' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it 'password:半角英数混合(半角数字のみ)' do
      @user.password = '1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it 'password:半角英数混合(全角のみ)' do
      @user.password = 'あああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it "パスワードは、確認用を含めて2回入力すること" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it "パスワードとパスワード（確認用）は、値の一致が必須であること" do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.last_name= ''
      @user.first_name= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Last name can't be blankFirst name can't be blank")
    end
    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.last_name_kana= ''
      @user.first_name_kana= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "First name kana can't be blank")
    end
    it "生年月日が必須であること" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end
