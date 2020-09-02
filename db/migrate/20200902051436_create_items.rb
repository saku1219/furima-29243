class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,                    null: false
      t.text       :image,                   null: false
      t.integer    :price,                   null: false
      t.text       :description,             null: false
      t.integer    :category_id,             null: false
      t.integer    :condition_id,            null: false
      t.integer    :shipping_payer_id,       null: false
      t.integer    :shipping_from_area_id,   null: false
      t.integer    :shipping_duration_id,    null: false
      t.references :user,                    null: false, foreign_key: true
      t.timestamps
    end
  end
end
