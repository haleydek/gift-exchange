class CreatePairs < ActiveRecord::Migration[5.2]
  def change
    create_table :pairs do |t|
      t.references :gifter, foreign_key: { to_table: :users }
      t.references :giftee, foreign_key: { to_table: :users }
      t.references :event, foreign_key: true
      
      t.timestamps
    end
  end
end
