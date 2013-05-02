class SubscriptionsController < ApplicationController

  def index
    @subscription = Subscription.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subscriptions }
    end
  end

  # GET /devices/new
  # GET /devices/new.json
  def new
    @subscription = Subscription.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subscription }
    end
  end

  # GET /matches/1/edit
#  def edit
 #   @match = Match.find(params[:id])
 # end

  # POST /devices
  # POST /devices.json
  def create
    @subscription = Subscription.new(params[:subscription])
    respond_to do |format|
      if @subscription.save
        format.json { render json: @subscription, status: :created, location: @subscription }
      else
        format.html { render action: "new" }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end
end