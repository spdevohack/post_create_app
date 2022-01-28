class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @posts = Post.search(params[:search])
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
    @post = current_user.posts.new(post_params) #link every post with user 
    
    if @post.save!
      redirect_to posts_index_path(@post), notice: "post created successfully"
      PostSendMail.new(@post).send_mail      #Using services for Sending mail 
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
    @post.destroy
    redirect_to posts_index_path, notice: "post was successfully deleted"
  end

  def draft
   
  end



  # def search
  #   @posts = Post.search(params[:search])
  # end

  # def download
  #   post = Post.find(params[:id]).attachment.url
  #   send_file Rails.root.join("uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}", post), type: 'image/jpeg'
  # end

  # def pdf    
  #       file_name = params[:feed_image_path].split('/').last
  #       @filename ="#{Rails.root}/public/uploads/feed_image/feedimage/#{file_name}"
  #       send_file(@filename ,
  #         :type => 'application/pdf/docx/html/htm/doc',
  #         :disposition => 'attachment')           
  # end

 private
  def post_params

    params.require(:post).permit( :title, :description, :attachment, :state)
  end


  # def user_signed?
  #   if user_signed_in?
  #     redirect_to new_user_session
  #   else
  #     redirect_to posts_index_path  
  #   end
  # end
  

end
