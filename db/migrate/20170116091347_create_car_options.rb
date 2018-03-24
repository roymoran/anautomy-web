class CreateCarOptions < ActiveRecord::Migration
  def change
    create_table :car_options do |t|
      t.string :name
      t.references :car_model, index: true

      t.timestamps null: false
    end
    add_foreign_key :car_options, :car_models
    # generate columns for each year from 1984 to current year
    current_year = Time.new.year 
    @years = (1984..current_year)
    @years.each do |year|
      add_column :car_options, "year_#{year}".to_sym, :boolean, :default => false
    end
  end
end
