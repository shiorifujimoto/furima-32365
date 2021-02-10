require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameとemail、password、assword_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空だと登録できない' do
      @user.email = ''
      @user.valid? 
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに＠が含まれていなければ登録できない' do
      @user.email = 'aagamil.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user,email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordは、半角英数字混合で6文字以上の場合登録できる' do
      @user.password = '11111a'
      @user.password_confirmation = '11111a'
      expect(@user).to be_valid
    end

    it 'passwordは、5文字以下の場合登録できない' do
      @user.password = '111aa'
      @user.password_confirmation = '111aa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordは、半角数字が含まれない場合登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    
    it 'passwordは、半角英字が含まれない場合登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '111aaa'
      @user.password_confirmation = '111bbb'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_nameが全角漢字、ひらがな、カタカナでない場合登録できない' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it 'first_nameが全角漢字、ひらがな、カタカナでない場合登録できない' do
      @user.first_name = 'taro'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it 'last_name_kanaが全角カタカナでない場合登録できない' do
      @user.last_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    
    it 'first_name_kanaが全角カタカナでない場合登録できない' do
      @user.first_name_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

  end 
end
