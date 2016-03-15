class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.string :image_url
      t.string :short_description
      t.string :customer_review
      t.string :price

      t.timestamps
    end
  end
end
