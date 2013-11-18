class CreateCertificationApplications < ActiveRecord::Migration
  def change
    create_table :certification_applications do |t|
      t.string :real_user_name
      t.integer :user_id
      t.string :certificater_name
      t.string :reason
      t.string :use_mode
      t.date :out_date
      t.date :back_date
      t.text :details

      t.timestamps
    end
  end
end
