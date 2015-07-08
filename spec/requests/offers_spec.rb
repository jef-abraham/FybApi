require 'rails_helper'

RSpec.describe "Offers", :type => :request do
  describe "Offer" do
    it 'should show the index page with search form' do
      get '/offers'
      expect(@response.status).to eq(200)
      expect(@response.content_type).to eq('text/html')
      expect(@response.body).to include("UId:")
      expect(@response.body).to include("Pub0:")
      expect(@response.body).to include("Page #:")      
    end

    it 'should show results given search parameters' do
      get '/offers?uid=player1&pub0=campaign2&page=1'
      expect(@response.status).to eq(200)
      expect(@response.content_type).to eq('text/html')
      expect(@response.body).to include("UId:")
      expect(@response.body).to include("Pub0:")
      expect(@response.body).to include("Page #:")

      expect(@response.body).to include("Offers")
      expect(@response.body).to include("Title")
      expect(@response.body).to include("Details")      
    end
  end   
end
