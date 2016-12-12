module ParameterBuilders
  module Concerns
    module TypeFormatters
      def soap_date(date)
        date.strftime('%Y-%m-%d')
      end
    end
  end
end
