module ClientsHelper
  def clients
   Client.all.collect{|client| [client.name, client.id]}
  end
 
 
end
