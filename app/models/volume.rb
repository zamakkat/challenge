class Volume < ActiveRecord::Base
	has_many :papers
  	validates_associated :papers
  	has_many :authors
  	validates_associated :authors

	validates :volume_id, :title, :month, :year, :address, :publisher, :url, presence: true

	validates :volume_id, uniqueness: true 
end
