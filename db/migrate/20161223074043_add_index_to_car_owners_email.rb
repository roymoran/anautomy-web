class AddIndexToCarOwnersEmail < ActiveRecord::Migration
  def change
  	add_index :car_owners, :email, unique: true
  end
end
