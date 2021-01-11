class AddDefaultValueToPicked < ActiveRecord::Migration[6.0]
  def up
    change_column_default :homes, :picked, :boolean, false
  end

  def down
    change_column_default :homes, :picked, :boolean, nil
  end
end
