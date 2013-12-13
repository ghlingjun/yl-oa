class CreateReimbursementDetails < ActiveRecord::Migration
  def change
    create_table :reimbursement_details do |t|
      t.integer :application_id
      t.integer :cost_type_id
      t.integer :business_purpose_id
      t.string :city
      t.datetime :consume_date
      t.decimal :money, :precision=>8, :scale=>2
      t.integer :currency_id
      t.boolean :invoice
      t.string :customer
      t.string :footnote
      t.string :location
      t.string :participant

      t.timestamps
    end
  end
end
