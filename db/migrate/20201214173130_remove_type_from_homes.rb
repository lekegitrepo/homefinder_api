class RemoveTypeFromHomes < ActiveRecord::Migration[6.0]
  def change
    remove_column :homes, :type, :string
  end
end
