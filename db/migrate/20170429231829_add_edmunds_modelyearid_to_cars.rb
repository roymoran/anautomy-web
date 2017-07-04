class AddEdmundsModelyearidToCars < ActiveRecord::Migration
  def change
    add_column :cars, :edmunds_modelyearid, :string
  end
end
