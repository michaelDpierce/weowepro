module WeoweFormsHelper
  WEOWEFORM_PARAMS = [:customer_first_name,
                      :customer_last_name,
                      :customer_phone_mobile,
                      :customer_email,
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
                      :description_2,
                      :quantity_2,
                      :dealer_total_value_2,
                      :description_3,
                      :quantity_3,
                      :dealer_total_value_3,
                      :description_4,
                      :quantity_4,
                      :dealer_total_value_4,
                      :description_5,
                      :quantity_5,
                      :dealer_total_value_5,
                      weowe_items_attributes: [:id, :weowe_form_id,
                                               :description, :quantity,
                                               :parts_value, :_destroy]
                     ]

  def weowe_form_params
    params.require(:weowe_form).permit(WEOWEFORM_PARAMS)
  end

  def dealer_sum(val1, val2, val3, val4, val5)
    @array = [val1, val2, val3, val4, val5].compact
    @array.reduce { |sum, x| sum + x }
  end
end
