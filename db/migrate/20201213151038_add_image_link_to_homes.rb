class AddImageLinkToHomes < ActiveRecord::Migration[6.0]
  def change
    add_column :homes, :image_link, :string
  end
end
