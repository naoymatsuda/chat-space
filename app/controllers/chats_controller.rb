class ChatsController < ApplicationController

  def index
    @groups = Group.all
    @group = Group.find(params[:group_id])
    @chat = Chat.new
    @chats = @group.chats.order('created_at DESC')
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to group_chats_path(@group)
    else
      flash[:alert] = 'メッセージの入力に失敗しました'
      render :new
    end
  end

  def chat_params
    params.require(:chat).permit(:text, :image, :group_id).merge(user_id: current_user.id)
  end
end
