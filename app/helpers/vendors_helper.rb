module VendorsHelper

def vendors_menu_collection
   Vendor.where("parent_id = ? OR id = 1", 1).all.collect{|v| [v.name, v.id]}
  end

def child_vendors_menu_collection
   Vendor.where("parent_id != ? ", 1).all.collect{|v| [v.name, v.id]}
end  

end
