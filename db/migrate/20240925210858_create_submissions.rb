class CreateSubmissions < ActiveRecord::Migration[7.1]
  def change
    create_table :submissions do |t|
      t.references :form, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.jsonb :responses

      t.timestamps
    end
  end
end
