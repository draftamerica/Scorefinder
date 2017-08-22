require 'json'
require 'net/http'
module Nfl
    def self.get_nfl_data(api_string)
        puts "/******get_nfl_data****"
        puts "/*****api_string, #{api_string.inspect}"
        HTTParty.get(api_string)
    end
end
