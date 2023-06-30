class CreateCreditCards < ActiveRecord::Migration[7.0]
  def change
    create_table :credit_cards do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :creditnr, null: false
      t.integer :expday, null: false
      t.integer :expmonth, null: false
      t.integer :expyear, null: false
      t.timestamps
    end
  end
end
