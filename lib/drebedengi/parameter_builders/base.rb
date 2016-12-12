require 'parameter_builders/concerns/type_formatters'

module ParameterBuilders
  class Base
    include ::ParameterBuilders::Concerns::TypeFormatters

    private

    def bool_param(key, value)
      param(key, !!value, 'boolean')
    end
    alias_method :boolean_param, :bool_param

    def date_param(key, value)
      param(key, soap_date(value), 'date')
    end

    def int_param(key, value)
      param(key, value, 'int')
    end
    alias_method :integer_param, :int_param

    def param(key, value, soap_type)
      builder.item do
        builder.key({'xsi:type' => 'xsd:string'}, key)
        builder.value({'xsi:type' => "xsd:#{soap_type}"}, value)
      end
    end

    def builder
      @builder ||= Builder::XmlMarkup.new
    end
  end
end
