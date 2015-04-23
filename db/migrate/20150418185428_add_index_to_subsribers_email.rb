class AddIndexToSubsribersEmail < ActiveRecord::Migration
  def change
  	add_index :subscribers, :email, unique: true
  end
end
