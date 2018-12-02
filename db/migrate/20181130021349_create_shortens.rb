class CreateShortens < ActiveRecord::Migration[5.1]
  def change
    create_table :shortens do |t|
      t.string :short_url
      t.string :real_url
      t.integer :count

      t.timestamps
    end

    add_index :shortens, :id
    add_index :shortens, :short_url, unique: true
  end
end
