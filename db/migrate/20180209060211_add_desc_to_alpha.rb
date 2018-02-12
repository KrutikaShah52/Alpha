class AddDescToAlpha < ActiveRecord::Migration[5.1]
  def change
    add_column :alpha_blogs, :descreption, :text, limit: 255
  end
end
