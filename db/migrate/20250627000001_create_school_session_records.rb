class CreateSchoolSessionRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :school_session_records do |t|
      t.references :session_detail, null: false, foreign_key: { to_table: :school_session_details }
      t.datetime :start_time, null: false
      t.integer :duration, null: false

      t.timestamps
    end
  end
end
