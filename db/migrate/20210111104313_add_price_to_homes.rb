class AddPriceToHomes < ActiveRecord::Migration[6.0]
  def change
    add_column :homes, :price, :float
  end
end
