class CreateSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :subscriptions do |t|
      t.belongs_to :facebook
      t.string :object, :fields, :verify_token
      t.text :history_json
      t.timestamps
    end
  end

  def self.down
    drop_table :subscriptions
  end
end
