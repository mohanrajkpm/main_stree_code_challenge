class Company < ApplicationRecord
  has_rich_text :description
  include ActiveModel::Validations
 	validates_with DomainValidator

 	before_save :create_city_state

 	# ############################
 	# updaate the city and state #
 	# ############################
 	def create_city_state
	 	begin
			zip_code = ZipCodes.identify(self.zip_code)
 			self.city = zip_code[:city]
 			self.state = zip_code[:state_code]
		rescue
			errors.add(:zip_code, 'Invalid zip_code')
      raise ActiveRecord::RecordInvalid.new(self)
		end
 	end

end
