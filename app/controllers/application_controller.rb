class ApplicationController < ActionController::API

    def secret
        ENV["MY_SECRET"]
    end
 
    def generate_token(payload)
        JWT.encode(payload, secret)
    end
   
    def decode_token
        token = request.headers['Authorization']
        begin
            JWT.decode(token, secret).first["id"]
        rescue
            {}
        end
    end
end
