class OfferController < ApplicationController

  def index
    if params['uid']
      puts "here>>"
      @offers = Offer.get(params)
      puts @offer.inspect
    end
  end
    
end
