class CreateMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :maps do |t|
      
      t.timestamps
    end
  end
end
