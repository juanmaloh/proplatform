class CreateJoinTableFormsCategories < ActiveRecord::Migration[6.1]
  def change
    create_join_table :forms, :categories do |t|
      t.index :form_id
      t.index :category_id
    end
  end
end
