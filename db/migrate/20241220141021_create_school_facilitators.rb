class CreateSchoolFacilitators < ActiveRecord::Migration[7.1]
  def change
    create_table :school_facilitators do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
