class PagesController < ApplicationController
    def index
        @disable_nav = true
    end

    def search
        if params[:search].blank?  
            redirect_to(root_path, alert: "Empty field!") and return  
          else  
            @parameter = params[:search].downcase  
            @results = Movie.all.where("lower(name) LIKE :search", search: @parameter)  
        end
    end
end
