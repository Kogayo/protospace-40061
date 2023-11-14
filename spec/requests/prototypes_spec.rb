require 'rails_helper'

RSpec.describe "Prototypes", type: :request do
  describe "GET /prototypes" do
    it "works! (now write some real specs)" do
      get prototypes_index_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get prototype_path(@prototype)
      expect(response.status).to eq 200
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのツイートのテキストが存在する' do 
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのツイートの画像URLが存在する' do 
    end
    it 'showアクションにリクエストするとレスポンスにコメント一覧表示部分が存在する' do 
    end
  end 
end
