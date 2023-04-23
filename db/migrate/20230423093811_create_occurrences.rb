class CreateOccurrences < ActiveRecord::Migration[7.0]
  def change
    create_table :occurrences do |t|
      t.references :engine, null: true, foreign_key: true
      t.string :series
      t.string :name
      t.references :literature, null: false, foreign_key: true
      t.string :volume
      t.string :number
      t.string :year
      t.string :page
      t.references :view, null: true, foreign_key: true
      t.references :quality, null: true, foreign_key: true
      t.string :date
      t.text :location
      t.integer :tender
      t.string :tender_series
      t.integer :detail
      t.references :user, null: true, foreign_key: true
      t.references :operator, null: true, foreign_key: true
      t.references :maker, null: true, foreign_key: true
      t.boolean :private
      t.text :note

      t.timestamps
    end
  end
end
