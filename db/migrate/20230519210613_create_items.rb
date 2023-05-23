class CreateItems < ActiveRecord::Migration[7.0]
  def change
    enable_extension "pgcrypto"
    create_table :items, id: :uuid do |t|
      t.string :name
      t.float :price

      t.timestamps
    end
  end
end
