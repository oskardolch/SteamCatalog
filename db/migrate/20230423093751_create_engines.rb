class CreateEngines < ActiveRecord::Migration[7.0]
  def change
    create_table :engines do |t|
      t.string :class_no
      t.string :name
      t.references :operator, null: true, foreign_key: true
      t.references :engine_type, null: true, foreign_key: true
      t.integer :alternate_for

      t.timestamps
    end
  end
end
