require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録できる時' do
      it '全項目の情報が存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordは６文字以上だと登録できる' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
      end
    end

    context '新規登録出来ない時' do
      it 'nameが空では登録できない' do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
  
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
  
      it 'emailは@を含まないと登録できない' do
        @user.email = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
  
      it 'passwordが存在してもpassword_confirmationが空では登録出来ない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが５文字以下では登録出来ない' do
        @user.password = 'aaa00'
        @user.password_confirmation = 'aaa00'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
  
      it 'passwordに全角が含まれていると登録出来ない' do
        @user.password = 'あaa000'
        @user.password_confirmation = 'あaa000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'first_nameが空では登録出来ない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
  
      it 'first_nameにアルファベットが含まれていると登録出来ない' do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
  
      it 'first_nameに数字が含まれていると登録出来ない' do
        @user.first_name = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
  
      it 'first_nameに記号が含まれていると登録出来ない' do
        @user.first_name = '＠'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'last_nameが空では登録出来ない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
  
      it 'last_nameにアルファベットが含まれていると登録出来ない' do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
  
      it 'last_nameに数字が含まれていると登録出来ない' do
        @user.last_name = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
  
      it 'last_nameに記号が含まれていると登録出来ない' do
        @user.last_name = '＠'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'first_name_kanaが空では登録出来ない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
  
      it 'first_name_kanaに漢字が含まれていると登録出来ない' do
        @user.first_name_kana = '一'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
  
      it 'first_name_kanaにひらがなが含まれていると登録出来ない' do
        @user.first_name_kana = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
  
      it 'first_name_kanaにアルファベットが含まれていると登録出来ない' do
        @user.first_name_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
  
      it 'first_name_kanaに数字が含まれていると登録出来ない' do
        @user.first_name_kana = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
  
      it 'first_name_kanaに記号が含まれていると登録出来ない' do
        @user.first_name_kana = '@'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it 'last_name_kanaが空では登録出来ない' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
  
      it 'last_name_kanaに漢字が含まれていると登録出来ない' do
        @user.last_name_kana = '一'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
  
      it 'last_name_kanaにひらがなが含まれていると登録出来ない' do
        @user.last_name_kana = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
  
      it 'last_name_kanaにアルファベットが含まれていると登録出来ない' do
        @user.last_name_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
  
      it 'last_name_kanaに数字が含まれていると登録出来ない' do
        @user.last_name_kana = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
  
      it 'last_name_kanaに記号が含まれていると登録出来ない' do
        @user.last_name_kana = '@'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'birthが空では登録出来ない' do
        @user.birth = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
  
      it '重複したEmailが存在すると登録出来ない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
    end
  end
end
