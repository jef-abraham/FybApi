class OfferController < ApplicationController

  def index
    if params['uid']
      @offers = Offer.get(params)
    end
  end
    
end
