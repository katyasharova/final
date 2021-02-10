class CreatePreds < ActiveRecord::Migration[6.0]
  def change
    create_table :preds do |t|
      t.text :text

      t.timestamps
    end
  end
end
