class AddAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.integer :user_id, index: true
      t.integer :question_id, index: true

      t.timestamps null: false
    end
  end
end
