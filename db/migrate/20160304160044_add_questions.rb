class AddQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :user_id, index: true
      t.integer :best_answer_id

      t.timestamps null: false
    end
  end
end
