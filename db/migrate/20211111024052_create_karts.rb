class CreateKarts < ActiveRecord::Migration[6.1]
  def change
    create_table :karts do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
