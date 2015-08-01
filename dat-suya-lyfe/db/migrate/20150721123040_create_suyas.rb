class CreateSuyas < ActiveRecord::Migration
  def change
    create_table :suyas do |t|
      t.string :meat
      t.boolean :spicy

      t.timestamps null: false
    end
  end
end
