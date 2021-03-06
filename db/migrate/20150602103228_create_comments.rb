class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text, null: false, limit: 140
      t.belongs_to :post, null: false
      t.belongs_to :user, null: false
      t.timestamps null: false
    end
  end
end
