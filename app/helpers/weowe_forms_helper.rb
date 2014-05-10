module WeoweFormsHelper
  WEOWEFORM_PARAMS = [:customer_first_name,
                      :customer_last_name,
                      :customer_phone_mobile,
                      :customer_email,
                      :customer_total_value,
                      :stock_number,
                      :make,
                      :vehicle_model,
                      :year,
                      :sold_date,
                      :weowe_info,
                      :theyowe_info,
                      :customer_signature,
                      :custom_date,
                      :color,
                      :dealer_labor_value,
                      :dealer_parts_value,
                      :dealer_total_value,
                      :pending,
                      :completed,
                      :user_id,
                      :dealer_id,
                      :description_1,
                      :quantity_1,
                      :dealer_total_value_1,
                      :dealer_wholesale_1,
                      :description_2,
                      :quantity_2,
                      :dealer_total_value_2,
                      :dealer_wholesale_2,
                      :description_3,
                      :quantity_3,
                      :dealer_total_value_3,
                      :dealer_wholesale_3,
                      :description_4,
                      :quantity_4,
                      :dealer_total_value_4,
                      :dealer_wholesale_4,
                      :description_5,
                      :quantity_5,
                      :dealer_total_value_5,
                      :dealer_wholesale_5,
                      :approved_by,
                      :completed_by,
                      :dealer_wholesale
                     ]

  def weowe_form_params
    params.require(:weowe_form).permit(WEOWEFORM_PARAMS)
  end

  def dealer_sum(val1, val2, val3, val4, val5)
    @array = [val1, val2, val3, val4, val5].compact
    @array.reduce { |sum, x| sum + x }
  end
end
