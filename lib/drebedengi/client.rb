require 'parameter_builders/get_record_list'

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
      Responses::GetBalance.new(raw_response.body)
    end

    def get_place_list
      raw_response = client.call(:get_place_list, message: api_creds)
      Responses::GetPlaceList.new(raw_response.body)
    end

    def get_record_list
      raw_response = client.call(
        :get_record_list,
        message:     ParameterBuilders::GetRecordList.new,
        soap_header: { "OpToken" => "secret" },
      )

      Responses::GetRecordList.new(raw_response.body)
    end

    def client
      @client ||= Savon.client(
        wsdl:       'http://www.drebedengi.ru/soap/dd.wsdl',
        proxy:      'http://localhost:8888',
        namespaces: { 'xmlns:ns2' => 'http://xml.apache.org/xml-soap' },
      )
    end
  end
end
