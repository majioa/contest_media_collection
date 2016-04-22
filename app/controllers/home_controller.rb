class HomeController < ApplicationController
   def index
      if current_user
         @user = current_user
         @items = @user.items.decorate

         render "items/index"
      else
         render nothing: true
      end
   end
end
