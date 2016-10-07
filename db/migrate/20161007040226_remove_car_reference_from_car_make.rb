class RemoveCarReferenceFromCarMake < ActiveRecord::Migration
  def change
  	remove_reference :car_makes, :car, index: true
  end
end
