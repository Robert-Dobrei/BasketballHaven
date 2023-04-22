class ApplicationController < ActionController::Base

    def hello
        render html: "hello world!"
    end

    def goodbye 
        render html: "goodbye world!"
    end

    def extra 
        render json: {
            "message": "hello world",
            "error": "goodbye world"
        }
    end

    def test
        @data = { nume: "Test", mesaj: "Message" }
        html_r = "HTML test"
        
        respond_to do |format|
          format.html { render html: html_r }
          format.json { render json: @data }
        end
    end

end
