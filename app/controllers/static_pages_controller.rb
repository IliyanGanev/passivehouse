class StaticPagesController < ApplicationController
  
  def home

    render html: '<p>nothing</p>'.html_safe
    # if logged_in?
    #   @micropost  = current_user.microposts.build
    #   @feed_items = current_user.feed.paginate(page: params[:page])
    # end

    #   @microposts = Micropost.all.paginate(page: params[:page])
     
    #    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def help
    p '#' * 40
    p request.user_agent
    p request.headers['User-Agent']
  end

  def about 
  end

  def demo 
    user = User.find_by(id: 101)
    current_user = user
    @micropost  = user.microposts.build
    @microposts = Micropost.all.paginate(page: params[:page])
    p @microposts
    p '#' * 100
  end

  def contact
  end

  def upload_form
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    else
      # @microposts = Micropost.where(tag: 'AutoCad').paginate(page: params[:page])
      render 'sessions/new'
    end
  end
  
  def autocad
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
    @microposts = Micropost.where(tag: 'AutoCad').paginate(page: params[:page])
  end
  
  def revit
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
    @microposts = Micropost.where(tag: 'Revit').paginate(page: params[:page])
  end

  def vectorworks
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
    @microposts = Micropost.where(tag: 'Vectorworks').paginate(page: params[:page])
  end
end
