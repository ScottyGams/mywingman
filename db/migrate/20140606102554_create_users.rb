class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :image
      t.string :phone
      t.text :blurb
      t.string :likes
      t.string :location

      t.timestamps
    end
  end
end
