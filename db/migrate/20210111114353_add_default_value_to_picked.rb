class AddDefaultValueToPicked < ActiveRecord::Migration[6.0]
  def up
    change_column_default :homes, :picked, false
  end

  def down
    change_column_default :homes, :picked, nil
  end
end
