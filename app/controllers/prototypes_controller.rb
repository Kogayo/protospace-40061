class PrototypesController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :move_to_edit, except: [:index, :show]
  

  def index
    @prototypes = Prototype.all
  end

  def update
    current_user.update(user_params)

  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
   if @prototype.save
    redirect_to root_path   
   else
    render :new
   end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end
  
def edit
  @prototype = Prototype.find(params[:id])

end

def update
  @prototype = Prototype.find(params[:id])
  if @prototype.update(prototype_params)
    redirect_to prototype_path(@prototype)
  else
    render :edit
  end 
end

def destroy
  @prototype = Prototype.find(params[:id])
  @prototype.destroy
  redirect_to root_path
end

  def user_params
    params.require(:user).permit(:name, :email, :profile, :occupation, :position)
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def move_to_edit
    unless user_signed_in? && @prototype_user == current_user
      redirect_to root_path
    end
  end
   
  
  end

