require 'uri'
require "net/http"

module Offer  
    def self.get(opt = {})
      params = {'appid'       => 157,
                'device_id'   => '2b6f0cc904d137be2e1730235f5664094b83',
                'ip'          => '109.235.143.113',
                'locale'      => 'de',
                'offer_types' => 122,
                'page'        => opt['page'],
                'ps_time'     => Time.now.to_i,
                'pub0'        => opt['pub0'],
                'timestamp'   => Time.now.to_i,
                'uid'         => opt['uid'],
               }            
      
      url = URI("http://api.sponsorpay.com/feed/v1/offers.json?hashkey=[HASHKEY]")
    
      req = Net::HTTP::Get.new(url)
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }
  end
end
