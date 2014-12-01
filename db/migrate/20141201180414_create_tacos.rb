class CreateTacos < ActiveRecord::Migration
  def change
    create_table :tacos do |t|
      t.string :name
      t.integer :price_in_cents
      t.string :photo_url

      t.timestamps
    end
  end
end
