class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.references :page, null: false, foreign_key: true
      t.string :name
      t.integer :position
      t.boolean :visible
      t.string :content_type
      t.text :content

      t.timestamps
    end
  end
end
