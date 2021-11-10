class AddFieldToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_reference :subscriptions, :fii, foreign_key: true
  end
end
