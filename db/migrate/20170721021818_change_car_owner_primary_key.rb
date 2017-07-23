class ChangeCarOwnerPrimaryKey < ActiveRecord::Migration
  	def up
      # Execute statement based on Postgresql
  	  execute "ALTER TABLE car_owners DROP CONSTRAINT car_owners_pkey CASCADE;"
  	  remove_column :car_owners, :id
      rename_column :car_owners, :uid, :id # rename existing uid column
      execute "ALTER TABLE car_owners ADD PRIMARY KEY (id);"
      execute "ALTER TABLE cars ALTER COLUMN car_owner_id TYPE varchar;"
    end

  	def down
      # Execute statement based on Postgresql
      execute "ALTER TABLE car_owners DROP CONSTRAINT car_owners_pkey CASCADE;"
      rename_column :car_owners, :id, :uid
      add_column :car_owners, :id, :primary_key
      execute "ALTER TABLE cars ALTER COLUMN car_owner_id TYPE integer USING car_owner_id::integer;"
    end
end
