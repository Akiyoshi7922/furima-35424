require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe "ユーザー新規登録" do

    context '正常系' do
    it 'すべての情報が登録できること' do
      expect(@user).to be_valid
    end
  end
    context '異常系' do
    it "nicknameが空だと登録できない" do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end

    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'Gmail.meo'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email is invalid")
    end
    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
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
    it 'password:passwordは５文字以下では登録できないこと' do
      @user.password = 'aa11'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
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
    it "ユーザー本名は、全角名字（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.last_name= 'koko'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
    end
    it "ユーザー本名は、全角名字が空では登録できない（漢字・ひらがな・カタカナ）" do
      @user.last_name= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "ユーザー本名は、全角名前（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.first_name= 'akira'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
    end
    it "ユーザー本名は、全角名前が空では登録できない（漢字・ひらがな・カタカナ）" do
      @user.first_name= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "ユーザー本名のフリガナは、全角名字（カタカナ）が空では登録できない" do
      @user.last_name_kana= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "ユーザー本名のフリガナは、全角名字（カタカナ）での入力が必須であること(半角)" do
      @user.last_name_kana= 'horohoro1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
    end
    it "ユーザー本名のフリガナは、全角名前（カタカナ）が空では登録できない" do
      @user.first_name_kana= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
    end
    it "ユーザー本名のフリガナは、全角名前（カタカナ）での入力が必須であること(半角)" do
      @user.first_name_kana= 'naruto1'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
    end
    it "全角カタカナ以外の全角文字では登録できないこと" do
      @user.last_name_kana= 'まりお1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
    end
    it "全角カタカナ以外の全角文字では登録できないこと" do
      @user.first_name_kana= 'まりお2'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
    end
    it "生年月日が必須であること" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
  end
end