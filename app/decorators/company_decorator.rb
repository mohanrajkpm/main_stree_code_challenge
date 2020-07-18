class CompanyDecorator < BaseDecorator
  def city_state
    "#{city}, #{state}"
  end
end