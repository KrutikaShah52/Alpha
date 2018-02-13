class RemoveColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :alpha_scaffolds, :User_id, :integer
  end
end
