class CreateMakers < ActiveRecord::Migration[7.0]
  def change
    create_table :makers do |t|
      t.string :name
      t.text :desc
      t.text :location
      t.text :note

      t.timestamps
    end
  end
end
