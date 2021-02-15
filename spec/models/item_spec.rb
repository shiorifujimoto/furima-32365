require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '新規の商品出品登録'  do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'imageとtitle,description,price,category_id,status_id,shoppong_cost_id,prefecture_id,hopping_day_idが存在すれば登録できる' do
      expect(@item).to be_valid
    end

    it 'imageが空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'titleが空では登録できないこと' do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end

    it 'descriptionが空では登録できないこと' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'priceが空では登録できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが数値300以上9999999以下でなければ登録できないこと' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it 'priceが全角数字では登録できないこと' do
      @item.price = "３００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it 'category_idがid:1では登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it 'status_idがid:1では登録できないこと' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it 'shoppong_cost_idがid:1では登録できないこと' do
      @item.shopping_cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shopping cost must be other than 1")
    end

    it 'prefecture_idがid:1では登録できないこと' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it 'shoppong_day_idがid:1では登録できないこと' do
      @item.shopping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shopping day must be other than 1")
    end
  end
end
