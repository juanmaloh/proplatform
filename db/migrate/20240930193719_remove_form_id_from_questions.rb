class RemoveFormIdFromQuestions < ActiveRecord::Migration[7.1]
  def change
    remove_column :questions, :form_id, :bigint
  end
end
