class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.timestampz :start_datetime
      t.timestampz :end_datetime
      t.integer :spend_limit

      t.timestamps
    end
  end
end
