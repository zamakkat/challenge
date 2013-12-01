class Author < ActiveRecord::Base
	has_many :papers
	validates_associated :papers
end
