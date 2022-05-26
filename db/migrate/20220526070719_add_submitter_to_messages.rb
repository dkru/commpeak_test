class AddSubmitterToMessages < ActiveRecord::Migration[7.0]
  def change
    add_reference :messages, :submiter, null: false, foreign_key: true
    remove_column :messages, :email
  end
end
