class AddCityToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :addresses, :city, :string
    Address.update_all(city: "")
    change_column :addresses, :city, :string, null: false
  end
end
