class TreesController < ApplicationController
  def new
  	@tree = Tree.new
  end

  def create
  	@tree = Tree.create(tree_params)
  end

  private
  def tree_params
  	params.require(:tree).permit(:name)
  end
end
