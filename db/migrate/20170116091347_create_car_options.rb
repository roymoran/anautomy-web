class CreateCarOptions < ActiveRecord::Migration
  def change
    create_table :car_options do |t|
      t.string :name
      t.references :car_model, index: true

      t.timestamps null: false
    end
    add_foreign_key :car_options, :car_models
    add_column :car_options, :year_1984, :boolean, :default => false
      add_column :car_options, :year_1985, :boolean, :default => false
      add_column :car_options, :year_1986, :boolean, :default => false
      add_column :car_options, :year_1987, :boolean, :default => false
      add_column :car_options, :year_1988, :boolean, :default => false
      add_column :car_options, :year_1989, :boolean, :default => false
      add_column :car_options, :year_1990, :boolean, :default => false
      add_column :car_options, :year_1991, :boolean, :default => false
      add_column :car_options, :year_1992, :boolean, :default => false
      add_column :car_options, :year_1993, :boolean, :default => false
      add_column :car_options, :year_1994, :boolean, :default => false
      add_column :car_options, :year_1995, :boolean, :default => false
    add_column :car_options, :year_1996, :boolean, :default => false
    add_column :car_options, :year_1997, :boolean, :default => false
    add_column :car_options, :year_1998, :boolean, :default => false
    add_column :car_options, :year_1999, :boolean, :default => false
    add_column :car_options, :year_2000, :boolean, :default => false
    add_column :car_options, :year_2001, :boolean, :default => false
    add_column :car_options, :year_2002, :boolean, :default => false
    add_column :car_options, :year_2003, :boolean, :default => false
    add_column :car_options, :year_2004, :boolean, :default => false
    add_column :car_options, :year_2005, :boolean, :default => false
    add_column :car_options, :year_2006, :boolean, :default => false
    add_column :car_options, :year_2007, :boolean, :default => false
    add_column :car_options, :year_2008, :boolean, :default => false
    add_column :car_options, :year_2009, :boolean, :default => false
    add_column :car_options, :year_2010, :boolean, :default => false
    add_column :car_options, :year_2011, :boolean, :default => false
    add_column :car_options, :year_2012, :boolean, :default => false
    add_column :car_options, :year_2013, :boolean, :default => false
    add_column :car_options, :year_2014, :boolean, :default => false
    add_column :car_options, :year_2015, :boolean, :default => false
    add_column :car_options, :year_2016, :boolean, :default => false
    add_column :car_options, :year_2017, :boolean, :default => false
  end
end
