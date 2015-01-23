class AddCategoryRefToAffairs < ActiveRecord::Migration
  def change
    add_reference :affairs, :category, index: true
    add_foreign_key :affairs, :categories
  end
end
