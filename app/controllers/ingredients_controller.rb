class IngredientsController < ApplicationController
    
    def show
    @ing=Ingredient.find(params[:id])
    @recipes=@ing.recipes.paginate(page: params[:page],per_page: 4)
    end

	def new
    @ing=Ingredient.new
	end

	def create

	@ing=Ingredient.new(ing_params)

	if @ing.save
	flash[:success]="Your ingredient has been created successfully"
	redirect_to recipes_path
    else
	render 'new'
	end
	end
	private

	def ing_params
    params.require(:ingredient).permit(:name)
	end

end