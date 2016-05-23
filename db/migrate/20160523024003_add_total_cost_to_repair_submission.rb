class AddTotalCostToRepairSubmission < ActiveRecord::Migration
  def change
    add_column :repair_submissions, :total_cost, :string
  end
end
