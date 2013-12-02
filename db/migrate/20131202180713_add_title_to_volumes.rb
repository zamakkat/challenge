class AddTitleToVolumes < ActiveRecord::Migration
  def change
    add_column :volumes, :title, :string
  end
end
