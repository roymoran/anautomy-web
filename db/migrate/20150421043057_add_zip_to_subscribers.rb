class AddZipToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :zip, :integer
  end
end
