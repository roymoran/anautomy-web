class AddRepairSubmissionToCar < ActiveRecord::Migration
  def change
    add_reference :cars, :repair_submission, index: true
    add_foreign_key :cars, :repair_submissions
  end
end
