class CreateAdminShows < ActiveRecord::Migration[5.0]
  def change
    create_table :shows do |t|
      t.string :venue_name, null: false
      t.string :venue_address
      t.string :venue_address_url
      t.string :venue_url
      t.date :date, null: false

      t.timestamps
    end
  end
end
