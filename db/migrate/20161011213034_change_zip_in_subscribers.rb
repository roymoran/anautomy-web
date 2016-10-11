class ChangeZipInSubscribers < ActiveRecord::Migration
  def change
  	change_column :subscribers, :zip, :string
  end
end
