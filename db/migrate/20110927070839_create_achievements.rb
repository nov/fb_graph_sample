class CreateAchievements < ActiveRecord::Migration
  def self.up
    create_table :achievements do |t|
      t.string :title, :description, :image_url
      t.integer :points
      t.timestamps
    end
  end

  def self.down
    drop_table :achievements
  end
end
