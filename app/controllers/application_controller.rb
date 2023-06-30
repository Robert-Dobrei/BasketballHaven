class ApplicationController < ActionController::Base
    before_action :set_current_user

    def set_current_user
        @user = current_user
    end

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

private 
    def check_admin 
        if current_user.role != 'admin'
            redirect_to root_path
            return
        end
    end

end
