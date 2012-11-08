module PlacementFulfilmentsHelper

def placement_fulfilment_client_name(client)
  client.name  rescue ""
end

def placement_fulfilment_vendor_name(vendor)
  vendor.name  rescue ""
end

def placement_fulfilment_subvendor_name(subvendor_id)
  
  Vendor.find_by_id(subvendor_id).name rescue""
end

def placement_fulfilment_consultant_id(consultant_id)
  
User.find_by_id(consultant_id).firstname rescue""
 end


def placement_fulfilment_recruiter_id(recruiter_id)
  
User.find_by_id(recruiter_id).firstname rescue""
 end

def placement_fulfilment_salesperson_id(salesperson_id)
  
User.find_by_id(salesperson_id).firstname rescue""
 end


def selected_vendor_id(vendor_id)
vendor_id rescue""  
end
end
