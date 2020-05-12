class ApplicationController < ActionController::API
 
    def generate_token(payload)
        byebug
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
end
