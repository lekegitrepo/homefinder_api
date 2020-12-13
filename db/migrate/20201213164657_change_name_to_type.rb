class ChangeNameToType < ActiveRecord::Migration[6.0]
  def change
    rename_column :homes, :name, :type
  end
end
