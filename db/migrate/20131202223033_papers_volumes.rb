class PapersVolumes < ActiveRecord::Migration
  def change
  	create_table :papers_volumes, id: false do |t|
    	t.integer :paper_id
    	t.string :volume_id
    end
  end
end
