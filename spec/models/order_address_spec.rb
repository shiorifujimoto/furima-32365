require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address,item_id: @item.id, user_id: @user.id)
      sleep 0.1
    end

    context '商品購入ができる時' do
      it '正しい情報（token,postal_coad,prefecture_id,city,block）が存在すれば購入できる' do
        @order_address.build = ''
        expect(@order_address).to be_valid
      end

      it '建物番号を含め、全て揃っている場合は購入できる' do
        expect(@order_address).to be_valid
      end
    end

    context '商品購入ができない時' do
      it 'tokenが空の場合購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_coadが空の場合購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_coadにハイフンが含まれていない場合購入できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end

      it 'prefecture_idが0の場合購入できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture must be other than 0')
      end

      it 'cityが空の場合購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'blockが空の場合購入できない' do
        @order_address.block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end

      it 'phone_numberが空の場合購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberにハイフンが含まれている場合購入できない' do
        @order_address.phone_number = '123456789-0'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが12桁以上の場合購入できない' do
        @order_address.phone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが英数混合の場合購入できない' do
        @order_address.phone_number = 'abc12345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
