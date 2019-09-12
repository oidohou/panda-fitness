class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.date :datestart
      t.date :dateEnd
      t.string :location
      t.string :type
      t.string :shortDesc
      t.text :description

      t.timestamps
    end
  end
end
