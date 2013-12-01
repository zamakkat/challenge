class Paper < ActiveRecord::Base
	belongs_to :volume

	has_many :authors
	validates_associated :authors


end
