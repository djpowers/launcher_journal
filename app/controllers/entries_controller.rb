class EntriesController < ApplicationController

  def index
    @entries = Entry.all.order(created_at: :desc)
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @entry = Entry.new
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = Entry.new(entry_params)

      if @entry.save
        redirect_to @entry, notice: 'Entry was successfully created.'
      else
        render :new
      end
  end

  def update
    @entry = Entry.find(params[:id])
      if @entry.update(event_params)
        redirect_to @entry, notice: 'Entry was successfully updated.'
      else
        render action: 'edit'
      end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    respond_to do |format|
    redirect_to entries_url
    end
  end

  private

    def entry_params
      params.require(:entry).permit(:title, :description, :author_id, :category_id)
    end

end
