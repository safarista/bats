class BeachesController < ApplicationController
  # skip_authorization_check only: [:index, :show]
  skip_before_filter :require_login, only: [:index, :show]
  # GET /beaches
  # GET /beaches.json
  def index
    @beaches = Beach.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @beaches }
    end
  end

  # GET /beaches/1
  # GET /beaches/1.json
  def show
    @beach = Beach.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @beach }
    end
  end

  # GET /beaches/new
  # GET /beaches/new.json
  def new
    @beach = Beach.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @beach }
    end
  end

  # GET /beaches/1/edit
  def edit
    @beach = Beach.find(params[:id])
  end

  # POST /beaches
  # POST /beaches.json
  def create
    @beach = Beach.new(params[:beach])

    respond_to do |format|
      if @beach.save
        format.html { redirect_to @beach, notice: 'Beach was successfully created.' }
        format.json { render json: @beach, status: :created, location: @beach }
      else
        format.html { render action: "new" }
        format.json { render json: @beach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /beaches/1
  # PUT /beaches/1.json
  def update
    @beach = Beach.find(params[:id])

    respond_to do |format|
      if @beach.update_attributes(params[:beach])
        format.html { redirect_to @beach, notice: 'Beach was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @beach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beaches/1
  # DELETE /beaches/1.json
  def destroy
    @beach = Beach.find(params[:id])
    @beach.destroy

    respond_to do |format|
      format.html { redirect_to beaches_url }
      format.json { head :no_content }
    end
  end
end
