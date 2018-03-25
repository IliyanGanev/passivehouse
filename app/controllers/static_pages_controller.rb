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
    p '#' * 40
    p request.user_agent
    p request.headers['User-Agent']
  end

  def about 
  end

  def demo 

  end

  def contact
  end
  
  def autocad
    @micropost  = current_user.microposts.build
    @feed_items = current_user.feed.paginate(page: params[:page])
    @microposts = Micropost.where(tag: 'AutoCad').paginate(page: params[:page])
  end
  
  def revit
    @micropost  = current_user.microposts.build
    @feed_items = current_user.feed.paginate(page: params[:page])
    @microposts = Micropost.where(tag: 'Revit').paginate(page: params[:page])
  end

  def vectorworks
    @micropost  = current_user.microposts.build
    @feed_items = current_user.feed.paginate(page: params[:page])
    @microposts = Micropost.where(tag: 'Vectorworks').paginate(page: params[:page])
  end
end
