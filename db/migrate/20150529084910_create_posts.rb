class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false, limit: 50
      t.text :content, null: false, limit: 1000
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
