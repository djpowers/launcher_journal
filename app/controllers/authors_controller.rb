class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.new(author_params)

      if @author.save
        redirect_to @author, notice: 'Author was successfully created. Happy writing!'
      else
        puts 'There was an error!'
        render :new
      end
  end

  def update
    @author = Author.find(params[:id])
      if @author.update(author_params)
        redirect_to @author, notice: 'Author was successfully updated. Happy writing!'
      else
        render action: 'edit'
      end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_url
  end

  private

    def author_params
      params.require(:author).permit(:name, :email)
    end

end
