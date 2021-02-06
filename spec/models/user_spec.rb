require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
end

describe 'ユーザー新規登録' do
  it "必要事項が入力されていれば新規登録できる" do
    expect(@user).to be_valid
  end

  it "nicknameが空の場合登録できない" do
    @user.nickname = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end

  it "emailが空の場合登録できない" do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it "passwordが空の場合登録できない" do
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it "first_nameが空の場合登録できない" do
    @user.first_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end

  it "second_nameが空の場合登録できない" do
    @user.second_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Second name can't be blank")
  end

  it "first_name_furiganaが空の場合登録できない" do
    @user.first_name_furigana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First name furigana can't be blank")
  end

  it "second_name_furiganaが空の場合登録できない" do
    @user.second_name_furigana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Second name furigana can't be blank")
  end

  it "birthdayが空の場合登録できない" do
    @user.birthday = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end

  it "emailが重複していると登録できない" do
    @user.save
    another_user = FactoryBot.build(:user, email: @user.email)
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
  end

  it "passwordが5文字以下の場合登録できない" do
    @user.password = "aaaaa"
    @user.password_confirmation = "aaaaa"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end

  it "passwordが半角英語のみの場合登録できない" do
    @user.password = "aaaaaa"
    @user.password_confirmation = "aaaaaa"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end

  it "passwordが数字のみの場合登録できない" do
    @user.password = "123456"
    @user.password_confirmation = "123456"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end

  it "passwordとpassword_confirmationが不一致の場合登録できない" do
    @user.password = "1aaaaaa"
    @user.password_confirmation = "2bbbbbb"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

end
end