require 'spec_helper'
load 'lib/modules/offer.rb'

describe "Offer" do
  it "should be able to make successfull call to Fyber API with bare minumum/default parameters" do
    expect(Offer.get.class).to eq(Hash)
  end
end
