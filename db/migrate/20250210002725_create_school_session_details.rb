class CreateSchoolSessionDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :school_session_details do |t| 
      t.string :title
      t.text :description
      t.references :targetable, polymorphic: true, index: true, null: true 
      t.timestamps
    end
  end
end