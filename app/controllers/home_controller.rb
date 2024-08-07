class HomeController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
    @chats = Chat.all
  end
end
