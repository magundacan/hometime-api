class AddContactNumbersToGuests < ActiveRecord::Migration[7.0]
  def change
    add_column :guests, :contact_numbers, :string, array:true, default: []
  end
end
