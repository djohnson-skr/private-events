class AddLocationNameDescriptionToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :name, :string
    add_column :events, :location, :string
    add_column :events, :description, :string
  end
end
