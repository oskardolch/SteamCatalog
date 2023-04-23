class CreateAccessories < ActiveRecord::Migration[7.0]
  def change
    create_table :accessories do |t|
      t.string :name
      t.references :maker, null: true, foreign_key: true

      t.timestamps
    end
  end
end
