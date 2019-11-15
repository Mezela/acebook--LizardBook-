class CommentLikesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    create(params[:comment_id], params[:redirect])
  end

  def create(comment_id, redirect_path)
    unless CommentLike.find_by(comment_id: comment_id, user_id: session[:user_id])
      @comment_like = CommentLike.create(comment_id: comment_id, user_id: session[:user_id])
    else
      destroy(comment_id)
    end
    redirect_to redirect_path || '/posts'
  end

  def destroy(comment_id)
    @comment_like = CommentLike.find_by(comment_id: comment_id, user_id: session[:user_id])
    @comment_like.destroy
  end

  def postinfo
    session[:last_liked_comment] = params[:comment_id]
  end

  def getinfo
    comment = Comment.find(session[:last_liked_comment])
    session[:last_liked_comment] = nil
    respond_to do |format|
      format.json { render json: { clikecount: c_likes_count(comment), exists: c_like_exist(comment.id) } }
    end
  end

  private

  def redirect_to_previous_page
    redirect = session[:path] || '/posts'
    session[:path] = nil
    redirect_to redirect
  end

  def c_likes_count(comment)
    comment.comment_likes.length
  end

  def c_like_exist(comment_id)
    !!CommentLike.find_by(user_id: session[:user_id], comment_id: comment_id)
  end
end
