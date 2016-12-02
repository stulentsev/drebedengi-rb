module ParameterBuilders
  class GetRecordList
    def to_s
      builder = Builder::XmlMarkup.new

      builder.apiId({'xsi:type' => 'xsd:string'}, 'demo_api')
      builder.login({'xsi:type' => 'xsd:string'}, 'demo@example.com')
      builder.pass({'xsi:type' => 'xsd:string'}, 'demo')

      builder.params('xsi:type' => 'ns2:Map') do
        builder.item do
          builder.key({'xsi:type' => 'xsd:string'}, 'is_report')
          builder.value({'xsi:type' => 'xsd:boolean'}, false)
        end
        builder.item do
          builder.key({'xsi:type' => 'xsd:string'}, 'is_show_duty')
          builder.value({'xsi:type' => 'xsd:boolean'}, true)
        end
        builder.item do
          builder.key({'xsi:type' => 'xsd:string'}, 'r_period')
          builder.value({'xsi:type' => 'xsd:int'}, 8)
        end
        builder.item do
          builder.key({'xsi:type' => 'xsd:string'}, 'r_how')
          builder.value({'xsi:type' => 'xsd:int'}, 1)
        end
        builder.item do
          builder.key({'xsi:type' => 'xsd:string'}, 'r_what')
          builder.value({'xsi:type' => 'xsd:int'}, 6)
        end
        builder.item do
          builder.key({'xsi:type' => 'xsd:string'}, 'r_currency')
          builder.value({'xsi:type' => 'xsd:int'}, 0)
        end
        builder.item do
          builder.key({'xsi:type' => 'xsd:string'}, 'r_is_place')
          builder.value({'xsi:type' => 'xsd:int'}, 0)
        end
        builder.item do
          builder.key({'xsi:type' => 'xsd:string'}, 'r_is_tag')
          builder.value({'xsi:type' => 'xsd:int'}, 0)
        end
      end

      builder.idList('xsi:nil' => 'true')

      builder.target!
    end
  end
end
