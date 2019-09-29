class CreateSubcats < ActiveRecord::Migration[5.1]
  def change
    create_table :subcats do |t|
      t.references :category, foreign_key: true
      t.string :name
      t.boolean :active

      t.timestamps
    end
  end
end
