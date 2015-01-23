class AddAffairRefToTimeSets < ActiveRecord::Migration
  def change
    add_reference :time_sets, :affair, index: true
    add_foreign_key :time_sets, :affairs
  end
end
