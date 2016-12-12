module ParameterBuilders
  class GetRecordList < Base
    attr_reader :id_list, :period_from, :period_to

    def initialize(id_list: nil, period_from: nil, period_to: nil)
      @id_list     = id_list
      @period_from = period_from
      @period_to   = period_to
    end

    def to_s

      builder.apiId({ 'xsi:type' => 'xsd:string' }, 'demo_api')
      builder.login({ 'xsi:type' => 'xsd:string' }, 'demo@example.com')
      builder.pass({ 'xsi:type' => 'xsd:string' }, 'demo')

      builder.params('xsi:type' => 'ns2:Map') do

        boolean_param('is_report', false)
        if period_from && period_to
          date_param('period_from', period_from)
          date_param('period_to', period_to)
          integer_param('r_period', 0)
        else
          integer_param('r_period', 1)
        end
        integer_param('r_how', 1) # detailed, no grouping

        # builder.item do
        #   builder.key({'xsi:type' => 'xsd:string'}, 'is_show_duty')
        #   builder.value({'xsi:type' => 'xsd:boolean'}, true)
        # end
        # builder.item do
        #   builder.key({'xsi:type' => 'xsd:string'}, 'r_period')
        #   builder.value({'xsi:type' => 'xsd:int'}, 8)
        # end
        # builder.item do
        #   builder.key({'xsi:type' => 'xsd:string'}, 'r_how')
        #   builder.value({'xsi:type' => 'xsd:int'}, 1)
        # end
        # builder.item do
        #   builder.key({'xsi:type' => 'xsd:string'}, 'r_what')
        #   builder.value({'xsi:type' => 'xsd:int'}, 6)
        # end
        # builder.item do
        #   builder.key({'xsi:type' => 'xsd:string'}, 'r_currency')
        #   builder.value({'xsi:type' => 'xsd:int'}, 0)
        # end
        # builder.item do
        #   builder.key({'xsi:type' => 'xsd:string'}, 'r_is_place')
        #   builder.value({'xsi:type' => 'xsd:int'}, 0)
        # end
        # builder.item do
        #   builder.key({'xsi:type' => 'xsd:string'}, 'r_is_tag')
        #   builder.value({'xsi:type' => 'xsd:int'}, 0)
        # end
      end

      if id_list
        builder.idList('xsi:type' => 'SOAP-ENC:Array') do
          id_list.each do |id|
            builder.item({ 'xsi:type' => 'xsd:string' }, id.to_s)
          end
        end
        # else
        #   builder.idList('xsi:nil' => 'true')
      end

      builder.target!
    end
  end
end
