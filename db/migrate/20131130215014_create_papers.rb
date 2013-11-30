class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :title
      t.string :month
      t.integer :year
      t.string :address
      t.string :publisher
      t.string :url

      t.timestamps
    end
  end
end
