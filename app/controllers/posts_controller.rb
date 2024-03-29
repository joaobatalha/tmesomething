class PostsController < ApplicationController
  # include ActionView::Helpers::TextHelper
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.order("created_at DESC").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

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
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    @post.author  = current_user.username

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
    @post = Post.find(params[:id])

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

  def like
    @post = Post.find(params[:id])

    if @post.likes_user_ids == nil
      @post.likes_user_ids = [current_user.id]
    else
      if (@post.likes_user_ids.include? current_user.id) || (@post.user_id == current_user.id)
        #user already liked this post, flash message
      else
        @post.likes_count += 1
        increment_score(@post.user_id)
        @post.likes_user_ids.push(current_user.id)
      end
    end
    @post.save
  end

  def trending
    @posts = Post.order("created_at DESC").where("likes_count >= '3'")

    respond_to do |format|
      format.html 
      format.json { render json: @posts }
    end
  end

  def filter
    if params[:categories].nil?
      @posts = Post.order("created_at DESC").all
    else
      @posts = Post.order("created_at DESC").where(:category => params[:categories])
    end
    render template: 'posts/filter', layout: false
  end
end
