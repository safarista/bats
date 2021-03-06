class PostsController < ApplicationController
  skip_before_filter :require_login
  # GET /posts
  # GET /posts.json
  def index
    if can? :access, :posts
      @posts = Post.order("posts.created_at DESC")
    else
      @posts = Post.where("posts.published IS NOT NULL" ).order("posts.published DESC")
    end
    @title = 'Blog'

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @title = @post.title
    @comments = @post.comments.reverse
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.try(:find, params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post                 = current_user.posts.new(params[:post])
    @post.ip_address_info = request.remote_ip
    @post.published       = Time.now unless !params[:post][:published] == '1' 
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.try(:find, params[:id])    

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
