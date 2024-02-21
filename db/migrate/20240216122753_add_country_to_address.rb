class AddCountryToAddress < ActiveRecord::Migration[7.1]
  def change
    add_column :addresses, :country, :string, default: "US"
  end
end
