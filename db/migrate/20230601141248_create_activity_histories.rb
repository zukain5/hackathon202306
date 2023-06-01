class CreateActivityHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :activity_histories do |t|
      t.datetime :acted_at
      t.text :note
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
