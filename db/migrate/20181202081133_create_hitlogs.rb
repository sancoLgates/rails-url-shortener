class CreateHitlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :hitlogs do |t|
      t.string :ip
      t.string :city
      t.string :country
      t.references :shorten, foreign_key: true

      t.timestamps
    end
  end
end
