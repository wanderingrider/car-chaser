require 'rails_helper'

RSpec.describe "情報提供", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
  end
  context '情報提供ができるとき' do
    #ログインする
    visit new_user_session_path
    #新規投稿ページへのボタンがあることを確認する
    #提供ページに移動する
    #フォームに情報を入力する
    #送信するとItemモデルのカウントが1上がることを確認する
    #地図情報を登録ページに遷移する
    #フォームに地名を入力する
    #送信するとMapのカウントが1上がることを確認する
    #トップページに遷移する
    #トップページには先程投稿した情報が存在することを確認する(画像)
    #トップページには先程投稿した情報が存在することを確認する(車種名)
    #トップページには先程投稿した情報が存在することを確認する(盗難日)
    #トップページには先程投稿した情報が存在することを確認する(ニックネーム)
  end
  context '情報を提供できないとき' do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      #トップページに遷移する
    end
  end
end
