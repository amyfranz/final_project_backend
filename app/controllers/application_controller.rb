class ApplicationController < ActionController::API
    # before_action :authorized
 
    def generate_token(payload)
        JWT.encode(payload, 'my_s3cr3t')
    end
   
    def decode_token
        token = request.headers['Authorization']
        begin
            JWT.decode(token, 'my_s3cr3t').first["id"]
        rescue
            {}
        end
    end
   
    # def decoded_token
    #   if auth_header
    #     token = auth_header.split(' ')[1]
    #     # header: { 'Authorization': 'Bearer <token>' }
    #     begin
    #       JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
    #     rescue JWT::DecodeError
    #       nil
    #     end
    #   end
    # end
   
    # def current_user
    #   if decoded_token
    #     user_id = decoded_token[0]['user_id']
    #     @user = User.find_by(id: user_id)
    #   end
    # end
   
    # def logged_in?
    #   !!current_user
    # end
   
    # def authorized
    #   render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    # end
end
