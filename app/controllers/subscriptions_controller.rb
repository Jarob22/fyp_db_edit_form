class SubscriptionsController < ApplicationController
  @@VALID_SUBSCRIPTION_TYPES = [ "MatchEntry", "TournamentEntry" ]
  skip_before_filter :verify_authenticity_token, :only => [:create]
  def index
    @subscriptions = Subscription.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subscriptions }
    end
  end

  # GET /subscriptions/new
  # GET /subscriptions/new.json
  def new
    @subscription = Subscription.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subscription }
    end
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
    @subscription = Subscription.find(params[:id])
    if not @@VALID_SUBSCRIPTION_TYPES.include? subscription[:model_type] 
      raise ArgumentError
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subscription }
    end
  end

  # POST /devices
  # POST /devices.json
  def create
    @subscription = Subscription.new(params[:subscription])
    if not @@VALID_SUBSCRIPTION_TYPES.include? @subscription[:model_type]
      raise ArgumentError
    end
    respond_to do |format|
      if @subscription.save
        format.json { render json: @subscription, status: :created, location: @subscription }
      else
        format.html { render action: "new" }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy

    respond_to do |format|
      #format.html { redirect_to subscriptions_url }
      format.json { head :no_content }
    end
  end
  
end
