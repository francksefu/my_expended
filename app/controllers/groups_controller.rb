class GroupsController < ApplicationController
  before_action :require_loggin
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      flash[:success] = 'Group save successfully'
      redirect_to groups_path
    else
      flash.now[:error] = 'Error : Group didn t save'
      render :new, locals: { group: @group }
    end
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def require_loggin
    return if current_user

    redirect_to homes_path
  end
end
