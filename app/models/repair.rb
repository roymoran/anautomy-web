class Repair < ActiveRecord::Base
  belongs_to :repair_submission
  #Model does not implement Repair.repair_category or Repair.repair_name since
  #both repair_category and repair_name are static lookup tables
  has_one :repair_category
  has_one :repair_name
end
