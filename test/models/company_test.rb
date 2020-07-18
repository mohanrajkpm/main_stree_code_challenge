
require "test_helper"
require "application_system_test_case"

class CompanyTest < ApplicationSystemTestCase

  # Test case following all the validations required
  test 'Create' do
    company = companies(:hometown_painting)

    assert_equal true, company.valid?
  end

  # is valid company's zip code
  test 'Create: company without zipcode' do
    company = companies(:brown_painting)

    assert_nil company.zip_code
    assert_equal false, company.valid?
  end

  # is invalid company's zip_code
  test 'Create: Invalid company zipcode' do
    company = companies(:my_company)

    assert_equal false, company.valid?
  end


  # is invalid company's email
  test 'Create: Invalid company email' do
    company = companies(:armstrong_painting)

    assert_nil  company.email.match(/\b[A-Z0-9._%a-z\-]+@getmainstreet\.com\z/)
    assert_equal false, company.valid?
  end


end 