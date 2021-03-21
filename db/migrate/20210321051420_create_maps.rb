class CreateMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :maps do |t|
      t.string     :address,   null: false
      t.float      :latitude,  null: false
      t.float      :longitude, null: false
      t.references :user,      null: false, foreign_key: true
      t.references :item,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
