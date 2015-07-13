class PuppiesController < ApplicationController
  def index
  	@puppies = Puppy.all
  end

  def new
  	@puppy = Puppy.new
  end

  def create
  	@puppy = Puppy.create(puppy_params)

  	if @puppy.save
  		flash[:success] = "Successfully Created!"
  		redirect_to puppies_path
  	else
  		# show new page again with error messages. 
  		@errors = @puppy.errors.full_messages
  		render :new
  	end
  end

  def show
  	@puppy = Puppy.find_by_id(params[:id])
  end

  def edit
  	@puppy = Puppy.find_by_id(params[:id])
  end

  def update
  	@puppy = Puppy.find_by_id(params[:id])
  	@puppy.update(puppy_params)

  	if @puppy.save
  		flash[:success] = "Successfully Update!"
  		redirect_to puppies_path
  	else
  		@errors = @puppy.errors.full_messages
  		render :edit
  	end

  end

  def destroy
  	@puppy = Puppy.find_by_id params[:id]
  	@puppy.destroy
  	redirect_to puppies_path, notice: "#{@puppy[:name]} was deleted from this application :("
  end

  private
  	def puppy_params
  		puppy_params = params.require(:puppy).permit(:name, :bio, :age, :image_url, :breed)
  	end	
end
