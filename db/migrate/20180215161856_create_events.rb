class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string  :name
      t.integer :age
      t.string  :address

      t.timestamps
    end
  end
end
