require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '情報提供機能' do
    context '商品情報を保存できるとき' do
      it '必要な情報を適切に入力すると、商品情報を保存できること' do
        expect(@item).to be_valid
        
      end
    end

    context '商品が保存できないとき' do
      it '車両画像を1枚つけないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.information_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Information name can't be blank")
      end
      it '盗難時の説明が必須であること' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it '盗難場所の情報が必須であること' do
        @item.theft_place_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Theft place must be other than 1')
      end
      it '盗難にあった地域の場所' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '盗難にあった日付情報が必須のこと' do
        @item.theft_day = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Theft day can't be blank" )
      end
    end
  end
end
