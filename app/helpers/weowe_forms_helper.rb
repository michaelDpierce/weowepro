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
                      weowe_items_attributes: [:id, :weowe_form_id, :description, :_destroy]
                     ]

  def weowe_form_params
    params.require(:weowe_form).permit(WEOWEFORM_PARAMS)
  end

  def verify_total(parts_value, labor_value)
    parts   = parts_value.nil? ? 0 : parts_value
    labor   = labor_value.nil? ? 0 : labor_value
    @total == parts + labor
  end
end
