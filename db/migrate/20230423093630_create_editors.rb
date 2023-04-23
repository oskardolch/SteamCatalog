class CreateEditors < ActiveRecord::Migration[7.0]
  def change
    create_table :editors do |t|
      t.string :name
      t.text :desc
      t.text :note

      t.timestamps
    end
  end
end
