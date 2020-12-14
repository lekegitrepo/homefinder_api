class AddHomeTypeToHomes < ActiveRecord::Migration[6.0]
  def change
    add_column :homes, :home_type, :string
  end
end
