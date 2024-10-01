class CreateResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :responses do |t|
      t.references :submission, null: false, foreign_key: true # Asociación con el envío (submission)
      t.references :question, null: false, foreign_key: true # Asociación con la pregunta
      t.references :option, foreign_key: true, optional: true # Si es una pregunta de opción múltiple
      t.text :answer, null: false # Respuesta del usuario

      t.timestamps
    end
  end
end
