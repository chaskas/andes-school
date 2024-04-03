class CreateSchoolStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :school_students do |t|
      t.string :name

      t.timestamps
    end
  end
end
