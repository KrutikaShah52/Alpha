class AddUserIdToAlphaScaffold < ActiveRecord::Migration[5.1]
  def change
    add_column :alpha_scaffolds, :userid, :integer
  end
end
