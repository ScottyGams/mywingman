class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.text :name

      t.timestamps
    end
  end
end