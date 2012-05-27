class CommentsController < ApplicationController
  skip_before_filter :require_login
  # load_and_authorize_resource :post
  # load_and_authorize_resource :comments, :through => :post
  # 
  # skip_load_and_authorize_resource :only => :show  
  # skip_load_and_authorize_resource :post, :only => :show
  
  # GET /comments
  # GET /comments.json
  def index
    @post = Post.try(:find, params[:post_id])
    @comments = @post.comments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @post = Post.try(:find, params[:post_id])
    @comment = @post.comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @post = Post.try(:find, params[:post_id])
    @comment = @post.comments.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @post    = Post.try(:find, params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @post                    = Post.try(:find, params[:post_id])
    @comment                 = @post.comments.create!(params[:comment])
    @comment.ip_address_info = request.remote_ip
    
    if logged_in?
      @comment.commenter     = current_user.full_name
      @comment.comment_email = current_user.email
    end

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @post    = Post.try(:find, params[:post_id])
    @comment = @post.comments.find(params[:id])
    
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @post, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
end
