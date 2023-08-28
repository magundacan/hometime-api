class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :code
      t.string :status

      t.references :guest

      t.datetime :start_date
      t.datetime :end_date

      t.integer :number_of_nights
      t.integer :number_of_guests
      t.integer :number_of_adults
      t.integer :number_of_children
      t.integer :number_of_infants

      t.integer :total_price_in_cents
      t.integer :payout_price_in_cents
      t.integer :security_price_in_cents

      t.string :currency

      t.timestamps
    end
  end
end
