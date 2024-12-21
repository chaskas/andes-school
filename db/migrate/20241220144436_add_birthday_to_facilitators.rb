class AddBirthdayToFacilitators < ActiveRecord::Migration[7.1]
  def change
    add_column :school_facilitators, :birthday, :date
  end
end
