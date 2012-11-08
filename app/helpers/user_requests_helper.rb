module UserRequestsHelper

def  request_user_name(user)
user.firstname + " " + user.lastname rescue ""
end

end
