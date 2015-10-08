class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # beLfore_filter :set_title
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @title = POST_ACTION_INFO["post"]["index"]
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
     @title = POST_ACTION_INFO["post"]["show"]
  end

  # GET /posts/new
  def new
    @post = Post.new
     @title = POST_ACTION_INFO["post"]["new"]
  end

  # GET /posts/1/edit
  def edit
     @title = POST_ACTION_INFO["post"]["edit"]
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: POST_ACTION_INFO["post"]["delete"] }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
     @title = POST_ACTION_INFO["post"]["delete"]
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :reviewed)
    end

    def set_title
      binding.pry
    end
end
