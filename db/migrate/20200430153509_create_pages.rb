class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.references :subject, null: false, foreign_key: true
      t.string :name
      t.integer :permalink
      t.integer :position
      t.boolean :visible

      t.timestamps
    end
    add_index("pages", "permalink")
  end
end
