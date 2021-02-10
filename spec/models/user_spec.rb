require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameとemail、password、assword_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      binding.pry
      
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    # it "emailが空だと登録できない" do
    #   @user.nickname = ''
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include("Nickname can't be blank")
    # end

    # it "passwordが空だと登録できない" do
    #   @user.nickname = ''
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include("Nickname can't be blank")
    # end

    # it "emailが空だと登録できない" do
    #   @user.nickname = ''
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include("Nickname can't be blank")
    # end

    # it "emailが空だと登録できない" do
    #   @user.nickname = ''
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include("Nickname can't be blank")
    # end

    # it "emailが空だと登録できない" do
    #   @user.nickname = ''
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include("Nickname can't be blank")
    # end

    # it "emailが空だと登録できない" do
    #   @user.nickname = ''
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include("Nickname can't be blank")
    # end
  end 
end
