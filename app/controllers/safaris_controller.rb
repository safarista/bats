class SafarisController < ApplicationController
  # # Filters and Authorization
  skip_before_filter :require_login, :only => [:index, :show]
  
  # load_and_authorize_resource :safari # no customization needed here
  # load_and_authorize_resource :destination, :through => :safari
  # before_filter :authorize_parent
  
  # GET /safaris
  # GET /safaris.json
  def index
    @safaris = Safari.all
    @title = 'Safaris, deals and destinations '

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @safaris }
    end
  end

  # GET /safaris/1
  # GET /safaris/1.json
  def show
    @safari = Safari.find(params[:id])
    @title = @safari.title

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @safari }
    end
  end

  # GET /safaris/new
  # GET /safaris/new.json
  def new
    @safari = Safari.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @safari }
    end
  end

  # GET /safaris/1/edit
  def edit
    @safari = Safari.find(params[:id])
  end

  # POST /safaris
  # POST /safaris.json
  def create
    @safari = Safari.new(params[:safari])

    respond_to do |format|
      if @safari.save
        format.html { redirect_to @safari, notice: 'Safari was successfully created.' }
        format.json { render json: @safari, status: :created, location: @safari }
      else
        format.html { render action: "new" }
        format.json { render json: @safari.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /safaris/1
  # PUT /safaris/1.json
  def update
    @safari = Safari.find(params[:id])

    respond_to do |format|
      if @safari.update_attributes(params[:safari])
        format.html { redirect_to @safari, notice: 'Safari was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @safari.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /safaris/1
  # DELETE /safaris/1.json
  def destroy
    @safari = Safari.find(params[:id])
    @safari.destroy

    respond_to do |format|
      format.html { redirect_to safaris_url }
      format.json { head :no_content }
    end
  end
  
  private
  # def authorize_parent
  #   authorize! :read, @safari
  # end
end
