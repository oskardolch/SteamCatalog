class CreateLiteratures < ActiveRecord::Migration[7.0]
  def change
    create_table :literatures do |t|
      t.text :title
      t.string :year
      t.references :editor, null: true, foreign_key: true

      t.timestamps
    end
  end
end
