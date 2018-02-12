class CreateAlphaBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :alpha_blogs do |t|
      t.string :title
      t.timestamps
    end
  end
end
