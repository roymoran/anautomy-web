class RepairCategory < ActiveRecord::Base
	# opting out of adding repair_id field to RepairCategory table 
	# since both RepairCategory and RepairName are fixed db tables. No need
	# to accesses RepairCategory or RepairName from Repair
	belongs_to :repair 
	has_many :repair_names
end
