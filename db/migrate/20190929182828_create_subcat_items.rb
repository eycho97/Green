class CreateSubcatItems < ActiveRecord::Migration[5.1]
  def change
    create_table :subcat_items do |t|
      t.references :subcat, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
