class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :fullname
      t.string :password_digest
      t.boolean :admin
      t.text :note
      t.boolean :prefer_private
      t.string :pref_lang

      t.timestamps
    end
  end
end
