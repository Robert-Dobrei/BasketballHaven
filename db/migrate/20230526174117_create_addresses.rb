class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :street, null: false
      t.integer :housenr, default: nil
      t.string :flat, default: ""
      t.integer :floor, default: nil
      t.integer :aptnr, default: nil
      t.timestamps
    end
  end
end