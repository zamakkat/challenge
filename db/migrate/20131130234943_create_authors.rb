class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :Firstname
      t.string :Lastname

      t.timestamps
    end
  end
end
