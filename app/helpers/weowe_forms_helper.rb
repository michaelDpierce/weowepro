module WeoweFormsHelper

  def verify_total(parts_value, labor_value)
    return '' unless !parts_value && !labor_value
    parts = parts_value.nil? ? '' : parts_value
    labor = labor_value.nil? ? '' : labor_value
    total = parts + labor
  end

end
