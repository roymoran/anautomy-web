class AddRepairDateToRepairSubmission < ActiveRecord::Migration
  def change
    add_column :repair_submissions, :repair_date, :date
  end
end
