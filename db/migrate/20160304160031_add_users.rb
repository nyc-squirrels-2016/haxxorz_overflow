class AddUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, index: true, unique: true
      t.string :password_digest
      t.string :email, null: false, unique: true
      t.text :image_url
      t.text :about

      t.timestamps null: false
    end
  end
end
