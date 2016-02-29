class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :user
      t.string :title, null: false
      t.string :description, null: false, length: 250
      t.string :date, null: false, length: 50


      t.timestamps null: false
    end
  end
end
