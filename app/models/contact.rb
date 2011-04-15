class Contact < ActiveRecord::Base
  validates_presence_of :name, :email

  def validate
    if !(self.email =~ (/^[a-zA-Z0-9_\.\-]+@[A-Za-z0-9_\.\-]+\.[A-Za-z0-9_\.\-]+$/))  
      errors.add(:email, :invalid2)  
    end
  end
end
