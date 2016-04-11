class AddVerificationToEvents < ActiveRecord::Migration
  def change
    add_column :events, :verified, :integer, default: 0

  end
end
