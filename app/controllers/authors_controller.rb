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

    respond_to do |format|
      if @event.save
        format.html { redirect_to @author, notice: 'Author was successfully created. Happy writing!' }
      else
        puts 'There was an error!'
        format.html { render :new }
      end
    end
  end

  def update
    @author = Author.find(params[:id])
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to @author, notice: 'Author was successfully updated. Happy writing!' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    respond_to do |format|
      format.html { redirect_to authors_url }
    end
  end

  private

    def author_params
      params.require(:author).permit(:name, :email)
    end

end
