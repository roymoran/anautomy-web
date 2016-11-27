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

# Seed data for car_makes table.
CarMake.create(name: 'Acura', year_2017: true)
CarMake.create(name: 'Alfa Romeo', year_2017: true)
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
CarModel.create(name: 'ILX', car_make_id: 1, year_2017: true)
CarModel.create(name: 'MDX', car_make_id: 1, year_2017: true)
CarModel.create(name: 'RDX', car_make_id: 1, year_2017: true)
CarModel.create(name: 'ILX', car_make_id: 1)
CarModel.create(name: 'RLX', car_make_id: 1)
CarModel.create(name: 'TLX', car_make_id: 1)
CarModel.create(name: 'NSX', car_make_id: 1)
CarModel.create(name: 'CDX', car_make_id: 1)

CarModel.create(name: 'MiTo', car_make_id: 2, year_2017: true)
CarModel.create(name: 'Giulietta', car_make_id: 2, year_2017: true)
CarModel.create(name: '4C', car_make_id: 2, year_2017: true)
CarModel.create(name: 'Giulia', car_make_id: 2)

#Seed data for shops
Shop.create(shop_name: "1. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "2. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "3. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "4. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "5. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "6. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "7. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")

Shop.create(shop_name: "8. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "9. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "10. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "11. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "12. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "13. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "14. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")

Shop.create(shop_name: "15. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "16. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "17. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "18. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "19. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "20. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "21. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")

Shop.create(shop_name: "22. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "23. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "24. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "25. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "26. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "27. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "28. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")

Shop.create(shop_name: "29. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "30. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "31. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "32. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "33. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "34. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")
Shop.create(shop_name: "35. Aby's Shop", shop_zip: "60609", shop_city: "Chicago", shop_state_code: "IL", shop_iso_country_code: "US", shop_neighborhood: "Brighton Park", shop_address: "4146 S. Western Ave.", shop_phone: "(773) 691-2638")

#Seed data for Repair Categories table
RepairCategory.create(name: 'Custom Repair Category') # 1
RepairCategory.create(name: 'General Maintenance') # 2
RepairCategory.create(name: 'Scheduled Maintenance') # 3
RepairCategory.create(name: 'Heating and Air Conditioning') # 4
RepairCategory.create(name: 'Brakes and Braking System') # 5
RepairCategory.create(name: 'Electrical Systems and Lights') # 6
RepairCategory.create(name: 'Suspension and Steering Systems') # 7
RepairCategory.create(name: 'Engine Repair') # 8
RepairCategory.create(name: 'Diagnoses') # 9
RepairCategory.create(name: 'Drivetrain') # 10
RepairCategory.create(name: 'Exhaust and Emissions') # 11
RepairCategory.create(name: 'Transmission (Automatic and Manual)') # 12


#Seed data for Repair Names table
RepairName.create(name: 'Custom Repair Name', repair_category_id: 1)

RepairName.create(name: 'Oil Change', repair_category_id: 2)
RepairName.create(name: 'Engine Coolant (Antifreeze) Change', repair_category_id: 2)
RepairName.create(name: 'Brake Fluid Change', repair_category_id: 2)
RepairName.create(name: 'Transmission Fluid Change', repair_category_id: 2)
RepairName.create(name: 'Engine Air Filter Replacement', repair_category_id: 2)
RepairName.create(name: 'Cabin Air Filter Replacement', repair_category_id: 2)
RepairName.create(name: 'Spark Plug(s) Replacement', repair_category_id: 2)
RepairName.create(name: 'Timing Belt Replacement', repair_category_id: 2)

RepairName.create(name: '8,000 Mile Service', repair_category_id: 3)


RepairName.create(name: 'AC Compressor Replacement', repair_category_id: 4)
RepairName.create(name: 'AC Condenser Replacement', repair_category_id: 4)
RepairName.create(name: 'AC Evaporator Replacement', repair_category_id: 4)
RepairName.create(name: 'AC Recharge', repair_category_id: 4)
RepairName.create(name: 'Heater Blower Motor Replacement', repair_category_id: 4)
RepairName.create(name: 'Heater Blower Motor Resistor Replacement', repair_category_id: 4)
RepairName.create(name: 'Heater Core Replacement', repair_category_id: 4)


RepairName.create(name: 'ABS Control Module Replacement', repair_category_id: 5)
RepairName.create(name: 'ABS Wheel Speed Sensor Replacement', repair_category_id: 5)
RepairName.create(name: 'Brake Caliper Replacement - Front', repair_category_id: 5)
RepairName.create(name: 'Brake Caliper Replacement - Rear', repair_category_id: 5)
RepairName.create(name: 'Brake Master Cylinder Replacement', repair_category_id: 5)

RepairName.create(name: 'Alternator Replacement', repair_category_id: 6)
RepairName.create(name: 'Battery Replacement', repair_category_id: 6)
RepairName.create(name: 'Door Window Motor Replacement', repair_category_id: 6)
RepairName.create(name: 'Door Window Regulator Replacement', repair_category_id: 6)
RepairName.create(name: 'Headlamp Bulb Replacement', repair_category_id: 6)

RepairName.create(name: 'Wheel Alignment', repair_category_id: 7)
RepairName.create(name: 'Wheel Alignment', repair_category_id: 7)
RepairName.create(name: 'Wheel Alignment', repair_category_id: 7)
RepairName.create(name: 'Wheel Alignment', repair_category_id: 7)
RepairName.create(name: 'Wheel Alignment', repair_category_id: 7)

RepairName.create(name: 'Fuel Injector Replacement', repair_category_id: 8)
RepairName.create(name: 'Fuel Pump Replacement', repair_category_id: 8)
RepairName.create(name: 'Head Gasket(s) Replacement', repair_category_id: 8)
RepairName.create(name: 'Ignition Coil Replacement', repair_category_id: 8)
RepairName.create(name: 'Mass Airflow Sensor Replacement', repair_category_id: 8)
RepairName.create(name: 'Intake Manifold Gasket Replacement', repair_category_id: 8)

RepairName.create(name: 'ABS System Diagnoses', repair_category_id: 9)

RepairName.create(name: 'Clutch Replacement', repair_category_id: 10)

RepairName.create(name: 'Catalytic Converter Replacement', repair_category_id: 11)
RepairName.create(name: 'Exhaust Manifold Gasket(s) Replacement', repair_category_id: 11)
RepairName.create(name: 'Exhaust Manifold Replacement', repair_category_id: 11)
RepairName.create(name: 'Oxygen Sensor Replacement - Front', repair_category_id: 11)
RepairName.create(name: 'Oxygen Sensor Replacement - Rear', repair_category_id: 11)

