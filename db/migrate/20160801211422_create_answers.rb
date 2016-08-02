class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :question, index: true
      t.string :answer, :unique => true
      t.integer :vote_like
      t.integer :vote_dislike

      t.timestamps null: false
    end
  end
end
