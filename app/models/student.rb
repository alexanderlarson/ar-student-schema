require_relative '../../db/config'
require 'date'

class Student < ActiveRecord::Base
# implement your Student model here
  def name
    first_name + " " + last_name
  end
  def age
    Time.now.utc.to_date.year - birthday.year
  end

end
