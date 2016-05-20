class AddShopToRepairSubmission < ActiveRecord::Migration
  def change
    add_reference :repair_submissions, :shop, index: true
    add_foreign_key :repair_submissions, :shops
  end
end
