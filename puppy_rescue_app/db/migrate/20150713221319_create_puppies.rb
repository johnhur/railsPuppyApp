class CreatePuppies < ActiveRecord::Migration
  def change
    create_table :puppies do |t|
      t.string :name
      t.integer :age
      t.string :breed
      t.text :bio
      t.text :image_url

      t.timestamps null: false
    end
  end
end
