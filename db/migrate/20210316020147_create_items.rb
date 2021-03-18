class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :information_name, null: false
      t.text       :description,      null: false  
      t.date       :theft_day,        null: false
      t.integer    :prefecture_id,    null: false
      t.references :user,             null: false, foreign_key: true
      t.timestamps 
    end
  end
end
