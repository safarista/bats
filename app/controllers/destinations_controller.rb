class DestinationsController < ApplicationController
  skip_load_and_authorize_resource :only => [:index, :show]
  before_filter :find_destineable
  respond_to :html
  # GET /destinations
  # GET /destinations.json
  def index
    @destinations = @destineable.destinations
  end
  # 
  # # GET /destinations/1
  # # GET /destinations/1.json
  def show
    @destination  = @destineable.destinations.find(params[:id])
    # @destination = Destination.find(params[:id])
  end
  # 
  # # GET /destinations/new
  # # GET /destinations/new.json
  def new
    @destination = @destineable.destinations.new
  end
  # 
  # # GET /destinations/1/edit
  def edit
    # params.each do |name, value|
    #   if name =~  /(.*?)_id/
    #     @destineable = $1.classify.constantize.find(value)
    #     @destineable
    #   end
    # end
    # render text: @destineable.inspect
    @destination  = @destineable.destinations.find(params[:id])
  end
  # 
  # # POST /destinations
  # # POST /destinations.json
  # def create
  #   @destination = Destination.new(params[:destination])
  # 
  #   respond_to do |format|
  #     if @destination.save
  #       format.html { redirect_to @destination, notice: 'Destination was successfully created.' }
  #       format.json { render json: @destination, status: :created, location: @destination }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @destination.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  # 
  # # PUT /destinations/1
  # # PUT /destinations/1.json
  def update
    
    @destination = Destination.find(params[:id])
  
    respond_to do |format|
      if @destination.update_attributes(params[:destination])
        format.html { redirect_to [@destineable, @destination], notice: 'Destination was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end
  # 
  # # DELETE /destinations/1
  # # DELETE /destinations/1.json
  # def destroy
  #   @destination = Destination.find(params[:id])
  #   @destination.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to destinations_url }
  #     format.json { head :no_content }
  #   end
  # end
  
  def create
    @destination = @destineable.destinations.build(params[:destination])
    if @destination.save
      redirect_to [@destineable, @destination], :notice => 'Destination was successfully added.'
    else
      flash[:error] = 'You cannot post an empty destination.'
      redirect_to :back
    end
  end


  private
  
  # def find_destineable
  #   params.each_with_index do |name, value|
  #     if value == params.length - 1
  #       if name[0].to_s =~ /(.+)_id$/
  #         @destineable = $1.classify.constantize.find(name[1])
  #         return @destineable
  #       end
  #     end
  #   end
  #   nil
  # end
  
  def find_destineable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        @destineable = $1.classify.constantize.find(value)
        return @destineable
      end
    end
    nil
  end
  # def find
  #     parents ||= []
  #     params.each do |name ,value|
  #       if name =~ /(.*?)_id/
  #           parents << $1.classify.constantize.find(value)
  #       end
  #     end
  # 
  #     return parents.last
  # end
end
