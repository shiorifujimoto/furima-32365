require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "test@test", last_name: "")
    end
    it "emailが空だと登録できない" do
    end
  end 
end
