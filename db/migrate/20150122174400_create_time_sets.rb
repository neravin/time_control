class CreateTimeSets < ActiveRecord::Migration
  def change
    create_table :time_sets do |t|
      t.datetime :time_end
      t.string :local_result

      t.timestamps null: false
    end
  end
end
