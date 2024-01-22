class Merchant < ActiveRecord::Migration[6.0]
  def change
    create_table :merchants do |t|
      t.string :merchant_id
      t.string :campaign_id
      t.string :user_id
      t.string :file_history_id
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :completed_at

    end

  end
end
