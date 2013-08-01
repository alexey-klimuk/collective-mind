class RemoveTitleFromSolutions < ActiveRecord::Migration
  def change
    remove_column :solutions, :title
  end
end
