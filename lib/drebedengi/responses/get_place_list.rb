require 'ostruct'

module Responses
  class GetPlaceList < ::Responses::Base
    attr_reader :places

    def initialize(soap_hash)
      @places = process(soap_hash)
    end

    private

    def process(soap_hash)
      soap_hash[:get_place_list_response][:get_place_list_return][:item].map do |hash|
        hash[:item].each_with_object(OpenStruct.new) do |hash, place|
          value = autocast_value_for_key(key: hash[:key], value: hash[:value])
          place[hash[:key]] = value
        end
      end
    end
  end
end
