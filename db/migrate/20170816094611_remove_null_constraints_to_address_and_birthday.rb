class RemoveNullConstraintsToAddressAndBirthday < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :birthday, :datetime, null: true
    change_column :users, :address, :string, null: true
  end
end
