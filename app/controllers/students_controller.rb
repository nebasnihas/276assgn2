class StudentsController < ApplicationController

  def index
  	@student = Student.all
  end

  def new
  	@student = Student.new
  end

  def create
  	@student = Student.new(post_params)

  	if @student.save
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  def show
  	@student = Student.find(params[:id])
  end

  def edit
  	@student = Student.find(params[:id])
  end

  def update
  	@student = Student.find(params[:id])
  	if @student.update(post_params)
  		redirect_to @student
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@student = Student.find(params[:id])
  	@student.destroy
  	redirect_to root_path
  end

def graph
  @student= Student.all
  render('graph')

end

private

  def post_params
    params.require(:student).permit(:name,:weight,:height,:color,:gpa,:description)
  end

end