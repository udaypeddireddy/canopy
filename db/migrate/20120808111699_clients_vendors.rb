class ClientsVendors < ActiveRecord::Migration
  def up
    create_table 'clients_vendors', :id => false do |t|
    t.column :client_id, :integer
    t.column :vendor_id, :integer
  end
  end

  def down
  end
end
