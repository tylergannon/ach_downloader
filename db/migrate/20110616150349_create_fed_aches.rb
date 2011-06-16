class CreateFedAches < ActiveRecord::Migration
  def change
    create_table :fed_aches do |t|
      t.string :routing_number
      t.string :office_code
      t.string :servicing_frb_number
      t.string :record_type_code
      t.string :change_date
      t.string :new_routing_number
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :zipcode_extension
      t.string :phone_area
      t.string :phone_prefix
      t.string :phone_suffix
      t.string :status_code
      t.string :data_view_code

      t.timestamps
    end
  end
end
