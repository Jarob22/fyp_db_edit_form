class MatchEntryController < ApplicationController
before_filter :authenticate_user!

  def new
    @matchEntry = MatchEntry.new
  end

  def create
    @matchEntry = MatchEntry.new(params[:match_entry])
    if @matchEntry.save
      redirect_to new_match_entry_path
    end
  end
  
  def edit
    @matchEntry = MatchEntry.find(params[:id])
  end
  
  def update
		@matchEntry = MatchEntry.find(params[:id])
		if @matchEntry.update_attributes(params[:match_entry])
		  redirect_to(@matchEntry)
		else
		  render :edit
		end
  end
  
  def show
    @matchEntry = MatchEntry.find(params[:id])
  end

end
