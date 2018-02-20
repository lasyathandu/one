class SchoolController < ApplicationController
	 
	def index
		@schools = School.all
	end
	def new
		@school = School.new
	end
	def show
    @school = School.find(params[:id])
  end
	
  def create
		@school = School.new(school_params)
		respond_to do |format|
		if @school.save
		format.html {redirect_to school_path,:notice => "School was successfully created"}
    else
		format.html {render action => "new"}
    end
    end   
  end
  def edit
    @school = School.find(params[:id])
  end
  def update
    @school = School.find(params[:id])  
    if @school.update_attributes(School_params)
    flash[:notice] = "School updated successfuly"
    redirect_to(School_path(@school))
    else          
    render('edit')
    end 
  end

  def delete
    @school = School.find(params[:id])

  end

  def destroy
    @school = School.find(params[:id])     
    @school.destroy
    flash[:notice] = "School '#{School.name}' destroy successfuly"
    redirect_to(school_path)

  end


	private
	def school_params
    params.require(:school).permit(:id , :name)
	end
end


