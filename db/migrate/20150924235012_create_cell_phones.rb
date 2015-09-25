class CreateCellPhones < ActiveRecord::Migration
  def change
    create_table :cell_phones do |t|
      # t.string :manufacturer, null: false
      t.integer :year, null: false
      t.string :battery_life, null: false
      t.text :description

      t.belongs_to :manufacturer, index: true
    end
  end
end
