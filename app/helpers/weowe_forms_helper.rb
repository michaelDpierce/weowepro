module WeoweFormsHelper

  def verify_total(parts_value, labor_value)
    parts = parts_value.nil? ? 0 : parts_value
    labor = labor_value.nil? ? 0 : labor_value
    total = parts + labor
  end

  def classification(pending, completed)
    if pending == true && completed == false
      @status = 'Pending'
    elsif pending == false && completed == false
      @status = 'Open'
    else
      @status = 'Closed'
    end
    return @status
  end
end
