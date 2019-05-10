class CreateLorePages < ActiveRecord::Migration[5.0]
  def change
    create_table :lore_pages do |t|
      t.string :name
      t.string :slug
      t.text :body
      t.integer :position

      t.timestamps
    end
  end
end
