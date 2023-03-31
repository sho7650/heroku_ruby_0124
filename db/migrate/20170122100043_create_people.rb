class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name
      t.date :birth
      t.string :home
      t.float :height
      t.string :office

      t.timestamps null: false
    end
  end
end
