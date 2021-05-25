class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def list_roles
    new_array = []
    self.characters.map do |character|
        new_array << "#{character.name} - #{character.show.name}"
    end
    new_array
  end
end