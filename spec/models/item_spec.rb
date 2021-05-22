require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品" do
    context '正常系' do
      it 'すべての情報が登録できること' do
        expect(@item).to be_valid
    end
  end
    context '異常系' do
    it "商品画像を1枚つけることが必須であること" do
      @item.image= nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it '商品名が必須であること' do
      @item.product_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Product name can't be blank"
    end
    it '商品の説明が必須であること' do
      @item.product_description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Product description can't be blank"
    end
    it 'カテゴリーの情報が必須であること' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Category is not a number"
    end
    it 'カテゴリーが1の場合は登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it '商品の状態についての情報が必須であること' do
      @item.product_status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Product status is not a number"
    end
    it '商品の状態が1の場合は登録できない' do
      @item.product_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Product status must be other than 1"
    end
    it '配送料の負担についての情報が必須であること' do
      @item.shipping_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping is not a number"
    end
    it '配送料の負担が1の場合は登録できない' do
      @item.shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping must be other than 1"
    end
    it '発送元の地域についての情報が必須であること' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture is not a number"
    end
    it '発送元の地域が1の場合は登録できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
    end
    it '発送までの日数についての情報が必須であること' do
      @item.shipping_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping day is not a number"
    end
    it '発送までの日数が1の場合は登録できない' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping day must be other than 1"
    end
    it '販売価格についての情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it '値段が半角英数混合では登録できないこと' do
      @item.price = '5a'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end
    it '値段が半角英語だけでは登録できないこと' do
      @item.price = 'aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end
    it '値段が全角数字の場合は登録できない' do
      @item.price = '７７７'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end
    it '値段が299円以下の場合は登録できない' do
      @item.price = 199
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
    it '値段が10_000_000円以上の場合は登録できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
  end
 end
end