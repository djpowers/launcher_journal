class EntriesController < ApplicationController

  def index
    @entries = Entry.all.order(:created_at)
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

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @entry = Entry.find(params[:id])
    respond_to do |format|
      if @entry.update(event_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url }
    end
  end

  private

    def entry_params
      params.require(:event).permit(:title, :description)
    end

end
