require 'ostruct'

module Responses
  class GetRecordList
    attr_reader :records

    def initialize(soap_hash)
      @records = process(soap_hash)
    end

    private

    def process(soap_hash)
      soap_hash[:get_record_list_response][:get_record_list_return][:item].map do |record_attributes|
        record_attributes[:value][:item].each_with_object(OpenStruct.new) do |hash, record|
          name, value = hash.values_at(:key, :value)
          record[name] = value
        end
      end
    end
  end
end
