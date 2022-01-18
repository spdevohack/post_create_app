class PostsController < ApplicationController
  def index
    @posts = Post.all.includes(:user)
  end

  def new
    @action = 'new'
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    # render json: @post
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      redirect_to posts_index_path(@post), notice: "post created successfully"
      PostSendMail.new(@post).send_mail
    else
      render 'new'
    end
  end

  def edit
    @action = 'edit'
     @post = Post.find(params[:id])
     render 'edit'
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_index_path(@post), notice: "post was successfully updated"
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    # debugger

    @post.destroy

    redirect_to posts_index_path, status: :see_other, notice: "post was successfully deleted"
  end


 private
  def post_params
    params.require(:post).permit( :title, :description, :user_id)
  end

end
