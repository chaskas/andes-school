class AddBirthdayToFacilitators < ActiveRecord::Migration[7.1]
  def change
    add_column :shool_facilitators, :birthday, :date
  end
end
