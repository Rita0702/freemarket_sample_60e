class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :name
      t.integer :brandgroup_id
      t.timestamps
    end
  end
end
