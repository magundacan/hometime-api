class AddUniqueIndexOnReservationCode < ActiveRecord::Migration[7.0]
  def change
    add_index :reservations, :code, unique: true
  end
end
