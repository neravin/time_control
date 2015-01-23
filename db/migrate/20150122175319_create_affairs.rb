class CreateAffairs < ActiveRecord::Migration
  def change
    create_table :affairs do |t|
      t.string :name
      t.string :description
      t.string :result

      t.timestamps null: false
    end
  end
end
