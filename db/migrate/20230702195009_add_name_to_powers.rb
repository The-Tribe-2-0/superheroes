class AddNameToPowers < ActiveRecord::Migration[7.0]
  def change
    add_column :powers, :name, :string
  end
end
