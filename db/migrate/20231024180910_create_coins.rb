class CreateCoins < ActiveRecord::Migration[7.0]
  def change
    create_table :coins do |t|
      t.string :description
      t.string :scronym
      t.string :url_image

      t.timestamps
    end
  end
end
