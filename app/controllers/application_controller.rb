class ApplicationController < ActionController::Base

    def hello
        render html: "hello world!"
    end

    def goodbye 
        render html: "goodbye world!"
    end

    def extra 
        render json: {
            "message": "hello world"
            "error" : "goodbye world"
        }
    end
end
