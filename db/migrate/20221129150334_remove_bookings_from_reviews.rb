class RemoveBookingsFromReviews < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :bookings_id
  end
end
