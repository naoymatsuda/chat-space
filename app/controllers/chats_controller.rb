class ChatsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :index, :create]

  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @chat = Chat.new
    @chats = @group.chats
  end

  def new
    @chat = Chat.new
    @user = current_user.id
  end

  def create
    @chat = current_user.chats.new(chat_params)
    if @chat.save
      respond_to do |format|
        format.html { redierct_to root_path }
        format.json
      end
    else
      flash[:alert] = 'メッセージの入力に失敗しました'
      render :index
    end
  end

  def chat_params
    params.require(:chat).permit(:text, :image, :group_id)
  end
end
