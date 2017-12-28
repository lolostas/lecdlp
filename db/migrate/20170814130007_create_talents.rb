class CreateTalents < ActiveRecord::Migration[5.0]
  def change
    create_table :talents do |t|
      t.string :talent_proposed
      t.text :description
      t.boolean :meeting
      t.boolean :lesson
      t.references :user, foreign_key: true, null: false
      t.references :category, foreign_key: true, null: false

      t.timestamps
    end
  end
end
