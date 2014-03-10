module WeoweFormsHelper

  def verify_total(parts_value, labor_value)
    parts = parts_value.nil? ? 0 : parts_value
    labor = labor_value.nil? ? 0 : labor_value
    total = parts + labor
  end

end
