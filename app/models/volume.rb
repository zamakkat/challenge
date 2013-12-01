class Volume < ActiveRecord::Base
	has_many :papers
  	validates_associated :papers

	validates :month, :year, :address, :publisher, :url, presence: true

	validates :month, uniqueness: { scope: :year } #assuming that primary key is month and year

end
