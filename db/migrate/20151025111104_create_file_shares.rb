class CreateFileShares < ActiveRecord::Migration
  def change
    create_table :file_shares do |t|
      t.string :user
      t.string :file_url

      t.timestamps null: false
    end
  end
end
