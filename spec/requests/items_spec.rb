require 'rails_helper'

describe ItemsController, type: :request do

  before do
    @item = FactoryBot.create(:item)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる'  do
      get root_path
      binding.pry
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済の車種名のテキストがある' do
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済の画像URLがある' do 
    end
    it 'indexアクションにリクエストするとレスポンスに検索フォームがある' do
    end
  end


end


