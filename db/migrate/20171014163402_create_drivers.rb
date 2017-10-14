class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :email
      t.string :location
      t.string :driver_img
      t.string :phone_number

      t.timestamps null: false
    end
    # First default driver
    Driver.create(name: 'Roy Moran', email: 'roy_moran1993@yahoo.com', location: 'NA', driver_img:'NA', phone_number: '(773) 679-4922')
  end
end
