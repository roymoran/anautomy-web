class ChangeCarOwnerPrimaryKey < ActiveRecord::Migration
  	def up
  	  execute "ALTER TABLE car_owners DROP CONSTRAINT car_owners_pkey CASCADE;"
  	  remove_column :car_owners, :id
      rename_column :car_owners, :uid, :id # rename existing uid column
      execute "ALTER TABLE car_owners ADD PRIMARY KEY (id);"
	end

  	def down
      # Remove the uid primary key. Note this differs based on your database
      execute "ALTER TABLE car_owners DROP CONSTRAINT car_owners_pkey;"
      rename_column :car_owners, :id, :uid
      add_column :car_owners, :id, :primary_key
    end
end
