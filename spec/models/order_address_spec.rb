require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do
    it 'すべての値が正しく入力されていれば、購入できる' do
      expect(@order).to be_valid
    end
    it 'クレジットカードの情報が間違っている場合、購入できない' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号の記載がない場合、購入できない' do
      @order.postal_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号にハイフンの記載がない場合、購入できない' do
      @order.postal_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code is invalid")
    end
    it '都道府県が選択されていない場合、購入できない' do
      @order.prefecture_id = '1'
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture is invalid")
    end
    it '市区町村の記載がない場合、購入できない' do
      @order.city = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it '番地の記載がない場合、購入できない' do
      @order.house_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("House number can't be blank")
    end
    it '建物名の記載がなくても、購入できる' do
      @order.building_name = ''
      expect(@order).to be_valid
    end
    it '電話番号の記載がない場合、購入できない' do
      @order.tell = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Tell can't be blank")
    end
    it '電話番号にハイフンの記載がある場合、購入できない' do
      @order.tell = '090-123456'
      @order.valid?
      expect(@order.errors.full_messages).to include("Tell is not a number")
    end
  end
end
