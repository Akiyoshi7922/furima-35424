require 'rails_helper'

RSpec.describe OrderPayjp, type: :model do

  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_payjp = FactoryBot.build(:order_payjp, user_id: user.id, item_id: item.id)
    sleep(1)
  end


  describe "商品購入" do


    context '正常系' do
      it 'すべての情報が登録できること' do
        expect(@order_payjp).to be_valid
      end
      it '建物名は任意であるため、入っていなくても登録できる' do
        @order_payjp.building_name = ''
        expect(@order_payjp).to be_valid
      end
    end
    context '異常系' do
    it "配送先の情報として、郵便番号が必須であること" do
      @order_payjp.postal_code = ''
      @order_payjp.valid?
      expect(@order_payjp.errors.full_messages).to include("Postal code can't be blank")
    end

    it "配送先の情報として、都道府県が必須であること" do
      @order_payjp.prefecture_id = ''
      @order_payjp.valid?
      expect(@order_payjp.errors.full_messages).to include("Prefecture is not a number")
    end

    it "配送先の情報として、市区町村が必須であること" do
      @order_payjp.city = ''
      @order_payjp.valid?
      expect(@order_payjp.errors.full_messages).to include("City can't be blank")
    end

    it "配送先の情報として、番地が必須であること" do
      @order_payjp.address = ''
      @order_payjp.valid?
      expect(@order_payjp.errors.full_messages).to include("Address can't be blank")
    end

    it "配送先の情報として、電話番号が必須であること" do
      @order_payjp.phone_number = ''
      @order_payjp.valid?
      expect(@order_payjp.errors.full_messages).to include("Phone number can't be blank")
    end

    it "郵便番号の保存には半角のハイフンが必要であること" do
      @order_payjp.postal_code = '1234567'
      @order_payjp.valid?
      expect(@order_payjp.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it "電話番号は11桁以内の数値のみ保存可能なこと" do
      @order_payjp.phone_number = '09012345'
      @order_payjp.valid?
      expect(@order_payjp.errors.full_messages).to include("Phone number Input only number")
    end

    it "電話番号が空の時は、保存不可なこと" do
      @order_payjp.phone_number = ''
      @order_payjp.valid?
      expect(@order_payjp.errors.full_messages).to include("Phone number can't be blank")
    end

    it "電話番号が英数字混合だと登録できない" do
      @order_payjp.phone_number = 'aaa1'
      @order_payjp.valid?
      expect(@order_payjp.errors.full_messages).to include("Phone number Input only number")
    end

    it "tokenが空では登録できないこと" do
      @order_payjp.token = ''
      @order_payjp.valid?
      expect(@order_payjp.errors.full_messages).to include("Token can't be blank")
    end

    it "prefecture_idが1だと登録できない" do
      @order_payjp.prefecture_id = '1'
      @order_payjp.valid?
      expect(@order_payjp.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "user_idが空では登録できないこと" do
      @order_payjp.user_id = ''
      @order_payjp.valid?
      expect(@order_payjp.errors.full_messages).to include("User can't be blank")
    end

    it "item_idが空では登録できないこと" do
      @order_payjp.item_id = ''
      @order_payjp.valid?
      expect(@order_payjp.errors.full_messages).to include("Item can't be blank")
    end

  end
 end
end


