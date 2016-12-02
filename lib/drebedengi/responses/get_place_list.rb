require 'ostruct'

module Responses
  class GetPlaceList
    attr_reader :places

    def initialize(soap_hash)
      @places = process(soap_hash)
    end

    private

    def process(soap_hash)
      soap_hash[:get_place_list_response][:get_place_list_return][:item].map do |hash|
        hash[:item].each_with_object(OpenStruct.new) do |hash, place|
          # TODO: parse numbers
          place[hash[:key]] = hash[:value]
        end
      end
    end
  end
end
