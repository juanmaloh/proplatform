class CreateFormsQuestionsJoinTable < ActiveRecord::Migration[7.1]
    def change
      create_table :forms_questions, id: false do |t|
        t.bigint :form_id
        t.bigint :question_id
      end
  
      add_index :forms_questions, [:form_id, :question_id], unique: true
      add_foreign_key :forms_questions, :forms
      add_foreign_key :forms_questions, :questions
    end
end
