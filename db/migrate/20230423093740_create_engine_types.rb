class CreateEngineTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :engine_types do |t|
      t.string :name
      t.text :desc

      t.timestamps
    end
  end
end
