require 'uri'
require 'net/http'
require 'digest/sha1'
require 'json'

module Offer  
    def self.get(opt = {})
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

      JSON.parse res.body
    end

    def self.get_hash_key(params)
      Digest::SHA1.hexdigest(params += '&b07a12df7d52e6c118e5d47d3f9e60135b109a1f')
    end
end
