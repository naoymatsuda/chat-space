class ChatsController < ApplicationController

  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @chat = Chat.new
    @chats = @group.chats.order('created_at DESC')
  end

  def new
    @chat = Chat.new
    @user = current_user.id
  end

  def create
    @chat = current_user.chats.new(chat_params)
    if @chat.save
      redirect_to group_chats_path, notice: 'チャットを作成しました。'
    else
      flash[:alert] = 'メッセージの入力に失敗しました'
      render :new
    end
  end

  def chat_params
    params.require(:chat).permit(:text, :image, :group_id)
  end
end
