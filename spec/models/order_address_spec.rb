require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品出品機能' do
    before do
      @order = FactoryBot.build(:order_address)
    end

    context '購入できるとき' do
      it '全項目の情報が正しく入力されている時' do
        expect(@order).to be_valid
      end

      it '建物名が入力されていない時' do
        @order.building = nil
        expect(@order).to be_valid
      end
    end

    context '購入できないとき' do
      it 'カード情報が正しく入力されていない時' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が入力されていない時' do
        @order.postal = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal can't be blank", 'Postal code input correctly')
      end

      it '郵便番号にハイフンがない時' do
        @order.postal = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code input correctly')
      end

      it '都道府県が選択されていない時' do
        @order.prefect_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefect Select')
      end

      it '市区町村が入力されていない時' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it '番地が入力されていない時' do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が入力されていない時' do
        @order.tel = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel can't be blank")
      end

      it '電話番号にハイフンが含まれる時' do
        @order.tel = '090-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include('Tel is invalid')
      end

      it '電話番号に全角文字が含まれる時' do
        @order.tel = '０９０１２３４５６７８'
        @order.valid?
        expect(@order.errors.full_messages).to include('Tel Half-width number')
      end
    end
  end
end
