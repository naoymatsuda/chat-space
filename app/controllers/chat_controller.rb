class ChatController < ApplicationController

  def index
    @groups = Group.all
  end

end
