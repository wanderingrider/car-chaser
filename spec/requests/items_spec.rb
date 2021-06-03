require 'rails_helper'

describe ItemsController, type: :request do

  before do
    @item = FactoryBot.create(:item)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる'  do
      get root_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済の車種名のテキストがある' do
      get root_path
      expect(response.body).to include(@item.information_name)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済の画像URLがある' do 
      get root_path
      expect(response.body).to include('test_image.png')
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みの盗難日の情報がある' do
      get root_path
      expect(response.body).to include('2021-12-31')
    end
    it 'indexアクションにリクエストするとレスポンスに投稿者名の情報がある' do
      get root_path
      expect(response.body).to include(@item.user.nickname)
    end
    it 'indexアクションにリクエストするとレスポンスに検索フォームがある' do
      get root_path
      expect(response.body).to include('車種を検索する')
    end
  end

  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
      get item_path(@item)
      expect(response.status).to eq 200
    end
    it 'showアクションにリクエストすると投稿済の車種名のテキストがある' do
      get item_path(@item)
      expect(response.body).to include(@item.information_name)
    end
    it 'showアクションにリクエストすると投稿すると投稿済の画像URLがある' do
      get item_path(@item)
      expect(response.body).to include('test_image.png')
    end
    it 'showアクションにリクエストするとレスポンスに投稿者名の情報がある' do
      get item_path(@item)
      expect(response.body).to include(@item.user.nickname)
    end
    it 'showアクションにリクエストするとレスポンスとして盗難日の情報がある' do 
      get item_path(@item)
      expect(response.body).to include('2021-12-31')
    end
    it 'showアクションにリクエストするとレスポンスに盗難にあった場所の情報がある' do
      get item_path(@item)
      expect(response.body).to include('2')
    end
    it 'showアクションにリクエストするとレスポンスに盗難にあった地域の情報がある' do
      get item_path(@item)
      expect(response.body).to include('2')
    end
  end

end


