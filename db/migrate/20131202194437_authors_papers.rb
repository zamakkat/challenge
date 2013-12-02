class AuthorsPapers < ActiveRecord::Migration
  def change
  	create_table :authors_papers do |t|
  		t.integer :author_id
    	t.integer :paper_id
    end
  	
  end
end
