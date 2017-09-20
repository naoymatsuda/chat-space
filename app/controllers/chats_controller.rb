class ChatsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :index, :create]

  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @chat = Chat.new
    @chats = @group.chats.order('created_at ASC')
    @users = @group.users

    respond_to do |format|
      format.html
      format.json { @reload_chat = @group.chats.where('id > ?', params[:num])}
    end
  end

  def new
    @chat = Chat.new
    @user = current_user.id
  end

  def create
    @group = Group.find(params[:group_id])
    @chat = current_user.chats.new(chat_params)
    if @chat.save
      respond_to do |format|
        format.html { redirect_to group_chats_path(@group) }
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
