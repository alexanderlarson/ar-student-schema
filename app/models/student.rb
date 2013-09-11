require_relative '../../db/config'
require 'date'

class Student < ActiveRecord::Base
# implement your Student model here
  validates :email, :uniqueness => true
  validates :email, :format => { :with => /\w+@\w+\.[a-zA-Z]{2,}/,
    :message => "Must be a valid email address" }
  validates :age, :numericality => { :greater_than_or_equal_to => 5, 
    :message => "Student must be at least %{count}." }
  validates :phone, :format => { :with => /\D?\d{3}\D{0,2}\d{3}\D?\d{4}/,
    :message => "Must be a valid phone number. Please." }


  def name
    first_name + " " + last_name
  end

  def age
    Time.now.utc.to_date.year - birthday.year
  end

end
