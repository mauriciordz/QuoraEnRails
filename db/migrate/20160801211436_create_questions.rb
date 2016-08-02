class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question, :unique => true
      t.integer :vote_like
      t.integer :vote_dislike

      t.timestamps null: false
    end
  end
end
