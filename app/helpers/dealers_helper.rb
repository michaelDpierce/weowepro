module DealersHelper
  DEALER_PARAMS = [:name,
                   :address_1,
                   :address_2,
                   :city,
                   :state,
                   :zip,
                   :phone_number,
                   :time_zone,
                   :logo
                  ]

  def dealer_params
    params.require(:dealer).permit(DEALER_PARAMS)
  end
end
