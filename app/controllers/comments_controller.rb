class CommentsController < ApplicationController
	load_and_authorize_resource
  def create
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.build(comment_params)
  	@comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'El comentario fue guardado' }
      else
        format.html { redirect_to @post, alert: 'El comentario no fue creado' }
      end
    end

  end

  def destroy
  	@post = Post.find(params[:post_id])
  	@comment = Comment.find(params[:id])
  	@comment.destroy

  	respond_to do |format|
  		format.html { redirect_to @post, notice: 'El comentario fue eliminado' }
  	end
  end

  private

  def comment_params
  	params.require(:comment).permit(:content)
  end

end
