require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context 'ユーザーの新規登録ができる場合' do
      it '必要な項目が入力されていれば新規登録ができる' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザーの新規登録ができない場合' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@がなければ登録できない' do
        @user.email = 'testexample'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '0000a'
        @user.password_confirmation = '0000a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは英字のみでは登録できない' do
        @user.password = 'aaaaaaa'
        @user.password_confirmation = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordは数字のみでは登録できない' do
        @user.password = '1111111'
        @user.password_confirmation = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordは全角では登録できない' do
        @user.password = "あああああああ"
        @user.password_confirmation = "あああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ageが空では登録できない' do
        @user.age = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Age can't be blank")
      end
      it 'ageが全角数字では登録できない' do
        @user.age = '２０'
        @user.valid?
        expect(@user.errors.full_messages).to include("Age is not a number")
      end
      it 'Favourite Sportsが空では登録できない' do
        @user.favorite_sports = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Favorite sports can't be blank")
      end
    end
  end
end
