require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/image/test.jpg')
    end

    context '出品できるとき' do
      it '全項目の情報がある' do
        expect(@item).to be_valid
      end

    end

    context '出品できないとき' do
      it '商品画像が添付されていない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空である' do
        @item.item = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item can't be blank")
      end

      it '商品の説明が空である' do
        @item.detail = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end

      it 'カテゴリーの情報が未選択' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態についての情報が未選択' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it '配送料の負担についての情報が未選択' do
        @item.deli_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deli fee must be other than 1")
      end

      it '配送元の地域についての情報紙選択' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end

      it '発送までの日数についての情報が未選択' do
        @item.deli_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deli day must be other than 1")
      end

      it '価格の情報が空である' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が¥299以下である' do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '価格が¥10000000以上である' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '価格に全角数字が含まれている' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '価格に数字以外の文字が入力されている' do
        @item.price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
