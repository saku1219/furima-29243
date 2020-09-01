require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    it 'すべての値が正しく入力されていれば登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空だと登録ができない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合、登録ができない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'emailに「＠」が含まれない場合、登録ができない' do
      @user.email = "test1234com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'passwordが空の場合、登録ができない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下の場合、登録ができない' do
      @user.password = "asd12"
      @user.password_confirmation = "asd12"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordが半角英数字混合でない場合、登録できない' do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordが存在しても、password_comfirmationが空だと登録できない' do
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'family_nameが空の場合、登録できない' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'first_nameが空の場合、登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'family_nameが全角日本語ではない場合、登録できない' do
      @user.family_name = "abc"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it 'first_nameが全角日本語ではない場合、登録できない' do
      @user.first_name = "abc"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it 'family_name_readingが空の場合、登録できない' do
      @user.family_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name reading can't be blank")
    end
    it 'first_name_readingが空の場合、登録できない' do
      @user.first_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading can't be blank")
    end
    it 'family_name_readingが全角カナではない場合、登録できない' do
      @user.family_name_reading = "abc"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name reading is invalid")
    end
    it 'first_name_readingが全角カナではない場合、登録できない' do
      @user.first_name_reading = "abc"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading is invalid")
    end
    it 'birthdayが空の場合、登録できない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
