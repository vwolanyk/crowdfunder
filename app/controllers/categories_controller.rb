class CategoriesController < ApplicationController

def index
  @projects = Project.page(params[:page]).per(10)
  @projects = @projects.order(:end_date)
end#index

def show
  @category = Category.find(params[:id])
end

end#class
