class CreateVolumes < ActiveRecord::Migration
  def change
    create_table :volumes do |t|
      t.string :month
      t.integer :year
      t.string :address
      t.string :publisher
      t.string :url

      t.timestamps
    end
  end
end
