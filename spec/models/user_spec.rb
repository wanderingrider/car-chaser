require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    context 'ユーザー新規登録ができるとき' do
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '00000a'
        @user.password_confirmation = '00000a'
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録ができないとき' do
      it 'nicknameが必須のこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが必須のこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは、@を含むこと' do
        @user.email = 'acom'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが必須のこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordは確認用を含めて２回入力すること' do
        @user.password = '00000a'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'paswordとpassword(確認用)は値の一致が必須あること' do
        @user.password = '00000a'
        @user.password_confirmation = '00000b'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordは、半角英数字での入力が必須であること' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid')
      end
      it 'passwordは、半角英数字での入力が必須であること' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid')
      end
      it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
      end
      it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name is invalid')
      end
      it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'ユーザー本名は、全角 (漢字・ひらがな・カタカナ)での入力が必須であること' do
        @user.first_name = 'tato'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること' do
        @user.read_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Read last name can't be blank", 'Read last name is invalid')
      end
      it 'ユーザー本名のフリガナは半角文字だと登録できないこと' do
        @user.read_last_name = 'abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include('Read last name is invalid')
      end
      it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること' do
        @user.read_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Read first name can't be blank", 'Read first name is invalid')
      end
      it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.read_last_name = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Read last name is invalid')
      end
      it 'ユーザー本名のフリガナは、全角(カタカナ）での入力が必須であること' do
        @user.read_first_name = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Read first name is invalid')
      end
    end
  end
end
