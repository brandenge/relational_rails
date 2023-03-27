class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.text :name, null: false
      t.date :birthdate, null: false
      t.boolean :is_alive, null: false, default: true
      t.integer :citation_count, null: false

      t.timestamps
    end
  end
end
