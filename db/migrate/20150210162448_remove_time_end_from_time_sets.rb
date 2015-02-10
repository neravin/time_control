class RemoveTimeEndFromTimeSets < ActiveRecord::Migration
  def change
    remove_column :time_sets, :time_end, :datetime
  end
end
