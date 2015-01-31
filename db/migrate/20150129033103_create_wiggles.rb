class CreateWiggles < ActiveRecord::Migration
  def self.up
    create_table :wiggles do |t|
      t.string :name
      t.string :checksum

      t.timestamps
    end
  end

  def self.down
    drop_table :wiggles
  end
end
