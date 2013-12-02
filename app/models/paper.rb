class Paper < ActiveRecord::Base
	belongs_to :volume

	has_and_belongs_to_many :authors

	validates :volume_id, :paper_id, :title, :month, :year, :address, :publisher, :url, presence: true

	validates :paper_id, uniqueness: {:scope => :volume_id}
end
