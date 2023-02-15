class CreateHoldRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :hold_requests do |t|
      t.references :student, null: false, foreign_key: true, :on_delete => :cascade, :on_update => :cascade
      t.references :book, null: false, foreign_key: true, :on_delete => :cascade, :on_update => :cascade

      t.timestamps
    end
  end
end
