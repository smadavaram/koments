class AddProfileIdToEchos < ActiveRecord::Migration[5.1]
  def change
    add_column :echos, :profile_id, :integer
    add_index :echos, :profile_id
  end
end
