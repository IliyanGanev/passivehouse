class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])

      @microposts = Micropost.all.paginate(page: params[:page])
     
       @users = User.where(activated: true).paginate(page: params[:page])
    end
  end

  def help
  end

  def about 
  end

  def contact
  end
  
end
