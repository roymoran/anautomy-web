class AddRepairSubmissionToShopRating < ActiveRecord::Migration
  def change
  	add_reference :shop_ratings, :repair_submission, index: true
    add_foreign_key :shop_ratings, :repair_submissions
  end
end
