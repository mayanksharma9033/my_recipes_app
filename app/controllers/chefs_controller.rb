class ChefsController < ApplicationController
  before_action  :set_chef, only: [:edit,:update,:show]
  before_action  :require_same_user, only: [:edit,:update]

  def index
  @chefs=Chef.paginate(page: params[:page], per_page: 3)
  end

  def new
   @chef=Chef.new
  end

  def create
   @chef=Chef.new(chef_params)

   if @chef.save
   	flash[:success]="Your profile has been created successfully"
    session[:chef_id]=chef.id
   	redirect_to  recipes_path
   else
   	render 'new'
   end
  end

  def edit
  end

  def update
   @chef=Chef.find(params[:id])

   if @chef.update(chef_params)
    flash[:success]="Your profile has benn updated successfully"
    redirect_to  recipes_path
  else
    render_edit
  end
  end

  def show
  @recipes=@chef.recipes.paginate(page: params[:page],per_page: 3)
  end

  private

  def chef_params
   params.require(:chef).permit(:chefname,:email,:password)
  end

  def require_same_user
   if current_user!=@chef
    flash[:danger]="You can edit only your own profile"
    redirect_to root_path
  end
  end

  def set_chef
  @chef=Chef.find(params[:id])
  end


end