class AddUserIdToAplhaScaffold < ActiveRecord::Migration[5.1]
  def change
    add_column :alpha_scaffolds, :user_id, :integer
  end
end
