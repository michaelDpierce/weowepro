module WeoweItemsHelper
  WEOWEITEM_PARAMS = [:id,
                      :description,
                      :weowe_form_id
                     ]

  def weowe_item_params
    params.require(:weowe_item).permit(WEOWEITEM_PARAMS)
  end
end
