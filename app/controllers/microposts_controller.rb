class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :edit]
   before_action :correct_user,  only: [:destroy, :edit]


  def index
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
    @microposts = Micropost.all
    if params[:search]
      @microposts = Micropost.search(params[:search]).order("created_at DESC").paginate(page: params[:page])
    else
     @microposts = Micropost.all.order("created_at DESC").paginate(page: params[:page])
    end
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      p 'sadf'
      @feed_items = []
      @microposts = Micropost.all.paginate(page: params[:page])
      render 'static_pages/upload_form'

    end
  end




def edit
    @micropost = Micropost.find(params[:id])
  end

  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update_attributes(micropost_params)
      flash[:success] = "Profile updated"
      redirect_to root_url 
    else
      render 'edit'
    end
  end





  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :tag, :picture, :attachment)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

end
