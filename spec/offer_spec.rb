require 'spec_helper'

describe "Offer" do
  it "should be able to make successfull call to Fyber API with bare minumum/default parameters" do
    pending("Some times, for a given URL params, the API returns results however for on second call or third call returns 'NO_CONTENT'.")
    expect(Offer.get.class).to eq(Hash)
  end
end
