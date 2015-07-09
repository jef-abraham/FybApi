require 'spec_helper'
load 'lib/modules/offer.rb'

describe "Offer" do
  it "should be able to make successfull call to Fyber API with bare minumum/default parameters" do
    pending("Some times, for a given URL params, the API returns results however for on second call or third call returns 'NO_CONTENT'.")
    expect(Offer.get.class).to eq(Array)
  end

  it "should return 'No Content' for invalid offer parameters" do
    pending("Some times, for a given URL params, the API returns results however for on second call or third call returns 'NO_CONTENT'.")    
    expect(Offer.get({'page' => 200, 'uid' => 'somthing_and_somehthing', 'pub0' => 'somthing'})).to eq('No Content')
  end
end
