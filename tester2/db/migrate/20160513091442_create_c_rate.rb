class CreateCRate < ActiveRecord::Migration
  def self.up
    change_table :CRate do |t|
      t.change(:Comment, :string, :limit => 50)
    end
  end

  def self.down
    drop_table :CRate
  end
end
