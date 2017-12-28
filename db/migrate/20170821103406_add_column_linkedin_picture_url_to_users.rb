class AddColumnLinkedinPictureUrlToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :linkedin_picture_url, :string
  end
end
