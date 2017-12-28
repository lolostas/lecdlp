class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.string :location
      t.references :destinator, foreign_key: {to_table: :users}
      t.references :creator, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
