class CreateForms < ActiveRecord::Migration[7.1]
  def change
    create_table :forms do |t|
      t.string :title, null: false # Título del formulario, obligatorio
      t.text :description, null: false # Descripción del formulario, obligatorio
      t.text :fields, null: false # Campos en formato JSON, obligatorio
      t.references :user, null: false, foreign_key: true # Asociación con el usuario, obligatorio

      t.timestamps
    end
  end
end
