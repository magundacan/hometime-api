class SetReservationCodeToRequired < ActiveRecord::Migration[7.0]
  def change
    change_column :reservations, :code, :string, null: false
  end
end
