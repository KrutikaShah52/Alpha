class CreateAlphaScaffolds < ActiveRecord::Migration[5.1]
  def change
    create_table :alpha_scaffolds do |t|
      t.string :title
      t.string :descreption
      t.timestamps
    end
  end
end
