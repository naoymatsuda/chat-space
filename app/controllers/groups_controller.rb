class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def show
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました。'
    else
      flash[:alert] = 'グループの作成に失敗しました'
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(params.require(:group).permit(:name))
    redirect_to root_path, notice: 'グループを編集しました。'
  end

  private
  def group_params
    params.require(:group).permit(:name, {:user_ids => []})
  end

end
