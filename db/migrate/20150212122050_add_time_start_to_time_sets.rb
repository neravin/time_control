class AddTimeStartToTimeSets < ActiveRecord::Migration
  def change
    add_column :time_sets, :time_start, :datetime
  end
end
