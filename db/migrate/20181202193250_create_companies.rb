class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
