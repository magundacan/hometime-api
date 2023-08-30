class SetGuestEmailToRequired < ActiveRecord::Migration[7.0]
  def change
    change_column :guests, :email, :string, null: false
  end
end
