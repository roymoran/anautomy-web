# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seed data for car_makes table.
CarMake.create(name: 'Acura')
CarMake.create(name: 'Alfa Romeo')
CarMake.create(name: 'Aston Martin')
CarMake.create(name: 'Bentley')
CarMake.create(name: 'BMW')
CarMake.create(name: 'Buick')
CarMake.create(name: 'Cadillac')
CarMake.create(name: 'Chevrolet')
CarMake.create(name: 'Chrysler')
CarMake.create(name: 'Dodge')
CarMake.create(name: 'Ferrari')
CarMake.create(name: 'FIAT')
CarMake.create(name: 'Ford')
CarMake.create(name: 'Genesis')
CarMake.create(name: 'Geo')
CarMake.create(name: 'GMC')
CarMake.create(name: 'Honda')
CarMake.create(name: 'Hummer')
CarMake.create(name: 'Hyundai')
CarMake.create(name: 'Infiniti')
CarMake.create(name: 'Isuzu')
CarMake.create(name: 'Jaguar')
CarMake.create(name: 'Jeep')
CarMake.create(name: 'Kia')
CarMake.create(name: 'Lamborghini')
CarMake.create(name: 'Land Rover')
CarMake.create(name: 'Lincoln')
CarMake.create(name: 'Lotus')
CarMake.create(name: 'Maserati')
CarMake.create(name: 'Mazda')
CarMake.create(name: 'McLaren')
CarMake.create(name: 'Mercedes-Benz')
CarMake.create(name: 'Mercury')
CarMake.create(name: 'MINI')
CarMake.create(name: 'Mitsubishi')
CarMake.create(name: 'Nissan')
CarMake.create(name: 'Oldsmobile')
CarMake.create(name: 'Plymouth')
CarMake.create(name: 'Pontiac')
CarMake.create(name: 'Porsche')
CarMake.create(name: 'Ram')
CarMake.create(name: 'Rolls-Royce')
CarMake.create(name: 'Saab')
CarMake.create(name: 'Saturn')
CarMake.create(name: 'Scion')
CarMake.create(name: 'Smart')
CarMake.create(name: 'Subaru')
CarMake.create(name: 'Suzuki')
CarMake.create(name: 'Tesla')
CarMake.create(name: 'Toyota')
CarMake.create(name: 'Volkswagen')
CarMake.create(name: 'Volvo')

#Seed data for car models table
CarModel.create(name: 'ILX', car_make_id: 1)
CarModel.create(name: 'MDX', car_make_id: 1)
CarModel.create(name: 'RDX', car_make_id: 1)
CarModel.create(name: 'ILX', car_make_id: 1)
CarModel.create(name: 'RLX', car_make_id: 1)
CarModel.create(name: 'TLX', car_make_id: 1)
CarModel.create(name: 'NSX', car_make_id: 1)
CarModel.create(name: 'CDX', car_make_id: 1)

CarModel.create(name: 'MiTo', car_make_id: 2)
CarModel.create(name: 'Giulietta', car_make_id: 2)
CarModel.create(name: '4C', car_make_id: 2)
CarModel.create(name: 'Giulia', car_make_id: 2)

#Seed data for shops
Shop.create(shop_name: "Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")

#Seed data for Repair Categories table
RepairCategory.create(name: 'Engine')
RepairCategory.create(name: 'Exhaust and Emissions')
RepairCategory.create(name: 'Heating and Air Conditioning')
RepairCategory.create(name: 'Brakes')
RepairCategory.create(name: 'Electrical and Lights')
RepairCategory.create(name: 'Suspension and Steering')
RepairCategory.create(name: 'General Maintenance')
RepairCategory.create(name: 'Diagnoses')
RepairCategory.create(name: 'Drive Train')

#Seed data for Repair Names table
RepairName.create(name: 'Fuel Injector Replacement', repair_category_id: 1)
RepairName.create(name: 'Fuel Pump Replacement', repair_category_id: 1)
RepairName.create(name: 'Head Gasket(s) Replacement', repair_category_id: 1)
RepairName.create(name: 'Ignition Coil Replacement', repair_category_id: 1)
RepairName.create(name: 'Mass Airflow Sensor Replacement', repair_category_id: 1)
RepairName.create(name: 'Intake Manifold Gasket Replacement', repair_category_id: 1)

RepairName.create(name: 'Catalytic Converter Replacement', repair_category_id: 2)
RepairName.create(name: 'Exhaust Manifold Gasket(s) Replacement', repair_category_id: 2)
RepairName.create(name: 'Exhaust Manifold Replacement', repair_category_id: 2)
RepairName.create(name: 'Oxygen Sensor Replacement - Front', repair_category_id: 2)
RepairName.create(name: 'Oxygen Sensor Replacement - Rear', repair_category_id: 2)


RepairName.create(name: 'AC Compressor Replacement', repair_category_id: 3)
RepairName.create(name: 'AC Condenser Replacement', repair_category_id: 3)
RepairName.create(name: 'AC Evaporator Replacement', repair_category_id: 3)
RepairName.create(name: 'AC Recharge', repair_category_id: 3)
RepairName.create(name: 'Heater Blower Motor Replacement', repair_category_id: 3)
RepairName.create(name: 'Heater Blower Motor Resistor Replacement', repair_category_id: 3)
RepairName.create(name: 'Heater Core Replacement', repair_category_id: 3)


RepairName.create(name: 'ABS Control Module Replacement', repair_category_id: 4)
RepairName.create(name: 'ABS Wheel Speed Sensor Replacement', repair_category_id: 4)
RepairName.create(name: 'Brake Caliper Replacement - Front', repair_category_id: 4)
RepairName.create(name: 'Brake Caliper Replacement - Rear', repair_category_id: 4)
RepairName.create(name: 'Brake Master Cylinder Replacement', repair_category_id: 4)

RepairName.create(name: 'Alternator Replacement', repair_category_id: 5)
RepairName.create(name: 'Battery Replacement', repair_category_id: 5)
RepairName.create(name: 'Door Window Motor Replacement', repair_category_id: 5)
RepairName.create(name: 'Door Window Regulator Replacement', repair_category_id: 5)
RepairName.create(name: 'Headlamp Bulb Replacement', repair_category_id: 5)

RepairName.create(name: 'Wheel Alignment', repair_category_id: 6)
RepairName.create(name: 'Wheel Alignment', repair_category_id: 6)
RepairName.create(name: 'Wheel Alignment', repair_category_id: 6)
RepairName.create(name: 'Wheel Alignment', repair_category_id: 6)
RepairName.create(name: 'Wheel Alignment', repair_category_id: 6)


RepairName.create(name: 'Oil and Filter Change', repair_category_id: 7)

RepairName.create(name: 'ABS System Diagnoses', repair_category_id: 8)

RepairName.create(name: 'Clutch Replacement', repair_category_id: 9)


