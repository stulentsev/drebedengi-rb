require 'savon'
require 'parameter_builders/base'
require 'parameter_builders/get_record_list'

require 'responses/base'
require 'responses/get_balance'
require 'responses/get_place_list'
require 'responses/get_record_list'

module Drebedengi
  class Client

    attr_accessor :api_creds

    def initialize
      @api_creds = {
        apiId: 'demo_api',
        login: 'demo@example.com',
        pass:  'demo',
      }
    end

    def get_balance
      raw_response = client.call(:get_balance, message: api_creds)
      Responses::GetBalance.new(raw_response.body).places
    end

    def get_place_list
      raw_response = client.call(:get_place_list, message: api_creds)
      Responses::GetPlaceList.new(raw_response.body).places
    end

    # Gets transactions
    #
    # @param id_list [Array] Get specific transactions by id
    # @param period_from [Date] Period from
    # @param period_to [Date] Period to
    def get_record_list(**kwargs)
      raw_response = client.call(
        :get_record_list,
        message:     ParameterBuilders::GetRecordList.new(**kwargs),
        soap_header: { "OpToken" => "secret" },
      )

      Responses::GetRecordList.new(raw_response.body).records
    end

    def client
      @client ||= ::Savon.client(
        wsdl:       'http://www.drebedengi.ru/soap/dd.wsdl',
        # proxy:      'http://localhost:8888',
        namespaces: {
          'xmlns:ns2' => 'http://xml.apache.org/xml-soap',
          'xmlns:SOAP-ENC' => 'http://schemas.xmlsoap.org/soap/encoding/',
        },
      )
    end
  end
end
