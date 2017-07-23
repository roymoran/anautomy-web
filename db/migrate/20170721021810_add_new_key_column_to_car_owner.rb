class AddNewKeyColumnToCarOwner < ActiveRecord::Migration
  def change
    add_column :car_owners, :uid, :string, null: false, default: 'NOTNULL'

    # Updating UID to be unique value to switch uid as primary key 
    # in next migration
    CarOwner.all.each do |p|
      p.uid = CarOwner.new_token
      p.save!
    end
  end

end
