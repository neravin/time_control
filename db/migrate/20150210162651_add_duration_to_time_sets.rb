class AddDurationToTimeSets < ActiveRecord::Migration
  def change
    add_column :time_sets, :duration, :integer
  end
end
