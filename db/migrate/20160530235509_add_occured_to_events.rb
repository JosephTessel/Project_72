class AddOccuredToEvents < ActiveRecord::Migration
  def change
    add_column :events, :occured, :integer, default: 0, null: false
  end
end
