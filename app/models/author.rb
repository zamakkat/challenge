class Author < ActiveRecord::Base
	belongs_to :volume

	has_and_belongs_to_many :papers
	validates_associated :papers

	validates :first_name, presence: true

	validates :first_name, uniqueness: true
end
