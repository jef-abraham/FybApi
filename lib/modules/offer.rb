require 'uri'
require 'net/http'
require 'digest/sha1'
require 'json'

module Offer  
  def self.get(opt = {})
    offers = 'Error'
    
      url_params = {'appid'       => 157,
                'device_id'   => '2b6f0cc904d137be2e1730235f5664094b83',
                'ip'          => '109.235.143.113',
                'locale'      => 'de',
                'offer_types' => 112,
                'page'        => opt['page'] || 1,
                'ps_time'     => Time.now.to_i,
                'pub0'        => opt['pub0'] || 'campaign2',
                'timestamp'   => Time.now.to_i,
                'uid'         => opt['uid'] || 'player1'
               }.collect{|k,v| "#{k}=#{v}"}.join('&')            

      url = URI("http://api.sponsorpay.com/feed/v1/offers.json?#{url_params}&hashkey=#{get_hash_key(url_params)}")

      req = Net::HTTP::Get.new(url)
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }

      if res.code == "200"
        json = JSON.parse(res.body)

        offers = json['offers'] if json['code'] == "OK"
        offers = "No Content" if json['code'] == "NO_CONTENT"
      end

      offers
    end

    def self.get_hash_key(params)
      Digest::SHA1.hexdigest(params += '&b07a12df7d52e6c118e5d47d3f9e60135b109a1f')
    end
end


# {"code":"ERROR_INVALID_UID","message":"An invalid user id (uid) was given as a parameter in the request."}
# {"code":"NO_CONTENT","message":"Successful request, but no offers are currently available for this user.","count":0,"pages":0,"information":{"app_name":"Demo iframe for publisher - do not touch","appid":157,"virtual_currency":"Coins","country":"DE","language":"DE","support_url":"http://offer.fyber.com/mobile/support?appid=157&client=api&uid=player1"},"offers":[]}
