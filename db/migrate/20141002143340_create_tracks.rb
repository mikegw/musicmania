class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.references :album, index: true
      t.string :track_type
      t.string :lyrics

      t.timestamps
    end
  end
end
