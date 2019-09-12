class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.float :idealWeight

      t.timestamps
    end
  end
end
