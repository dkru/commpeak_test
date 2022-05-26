class CreateSubmiters < ActiveRecord::Migration[7.0]
  def change
    create_table :submiters do |t|
      t.string :email

      t.timestamps
    end
  end
end
