# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Seed data for car years based on EPA from 1984-2017
CarYear.create(year: 1984)
CarYear.create(year: 1985)
CarYear.create(year: 1986)
CarYear.create(year: 1987)
CarYear.create(year: 1988)
CarYear.create(year: 1989)
CarYear.create(year: 1990)
CarYear.create(year: 1991)
CarYear.create(year: 1992)
CarYear.create(year: 1993)
CarYear.create(year: 1994)
CarYear.create(year: 1995)
CarYear.create(year: 1996)
CarYear.create(year: 1997)
CarYear.create(year: 1998)
CarYear.create(year: 1999)
CarYear.create(year: 2000)
CarYear.create(year: 2001)
CarYear.create(year: 2002)
CarYear.create(year: 2003)
CarYear.create(year: 2004)
CarYear.create(year: 2005)
CarYear.create(year: 2006)
CarYear.create(year: 2007)
CarYear.create(year: 2008)
CarYear.create(year: 2009)
CarYear.create(year: 2010)
CarYear.create(year: 2011)
CarYear.create(year: 2012)
CarYear.create(year: 2013)
CarYear.create(year: 2014)
CarYear.create(year: 2015)
CarYear.create(year: 2016)
CarYear.create(year: 2017)

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


