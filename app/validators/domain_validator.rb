require 'resolv'
class DomainValidator < ActiveModel::Validator
  def validate(record)
    mail_server = "getmainstreet.com"
     
    if record.email.present?
      domain = record.email.split('@').last
      if record.email =~ (/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i)
        if mail_server != domain
          record.errors.add(:email, "The domain #{domain} does not exist. Please enter a valid email address.")
        end
      else
        record.errors.add(:email, 'invalid email address.')
      end
    end 
  end
end