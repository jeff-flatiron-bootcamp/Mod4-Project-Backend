class CreateTiles < ActiveRecord::Migration[6.0]
  def change
    create_table :tiles do |t|
      t.string :url
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
