class AddYearColumnsToCarMakes < ActiveRecord::Migration
  def change
	# generate columns for each year from 1984 to current year
	current_year = Time.new.year
	@years = (1984..current_year)
	@years.each do |year|
		add_column :car_makes, "year_#{year}".to_sym, :boolean, :default => false
	end
  end
end
