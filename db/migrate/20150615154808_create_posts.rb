class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.boolean :reviewed

      t.timestamps
    end
  end
end
