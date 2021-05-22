require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
  end

  describe "#create" do
    it "商品画像を1枚つけることが必須であること" do
      @item.image= nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it '商品名が必須であること' do
      @item.prodcut_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Prodcut name can't be blank"
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
    it '商品の状態についての情報が必須であること' do
      @item.product_status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Status must exist"
    end
    it '配送料の負担についての情報が必須であること' do
      @item.shipping_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping fee must exist"
    end
    it '発送元の地域についての情報が必須であること' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping area must exist"
    end
    it '発送までの日数についての情報が必須であること' do
      @item.shipping_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping days must exist"
    end
    it '販売価格についての情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping fee must exist"
    end



  end
end