class CreateEnquiriesTable < ActiveRecord::Migration
  def up
    create_table :enquiries do |t|
      t.string :name
      t.string :email
      t.text :message
      t.boolean :replied, default: :false
      
      t.timestamps
    end
  end
  
  def down
    drop_table :enquiries
  end
end
