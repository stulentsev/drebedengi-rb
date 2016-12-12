module Responses
  module Concerns
    module TypeConversions
      def autocast_value_for_key(key:, value:)
        integer_keys = %w[id budget_family_id type icon_id parent_id sum place_id
                          budget_object_id currency_id operation_type group_id user_nuid]
        boolean_keys = %w[is_hidden is_for_duty is_autohide is_duty is_credit_card
                          is_currency_change ]
        date_keys = %w[operation_date]

        case key
        when *integer_keys
          value && Integer(value)
        when *boolean_keys
          value == 't'
        when *date_keys
          ::Time.parse(value)
        else
          value
        end

      end
    end
  end
end
