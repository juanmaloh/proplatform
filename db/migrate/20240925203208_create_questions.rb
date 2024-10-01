  class CreateQuestions < ActiveRecord::Migration[6.0]
    def change
      create_table :questions do |t|
        t.references :form, null: false, foreign_key: true
        t.references :category, null: false, foreign_key: true # Asegúrate de que este campo esté presente
        t.string :content, null: false
        t.string :question_type, null: false

        t.timestamps
      end
    end
  end
