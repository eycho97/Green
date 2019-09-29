class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.string :blurb
      t.text :description
      t.string :picture
      t.string :link
      t.boolean :featured
      t.boolean :active

      t.timestamps
    end
  end
end
