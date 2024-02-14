class ExpendsController < ApplicationController
  before_action :require_loggin

  layout 'expend'
  def index
    @group = Group.find(params[:group_id].to_i)
    @expends = Expend.where(author: current_user, group: @group).order(created_at: :desc)
  end

  def new
    @expend = Expend.new
    @groups = current_user.groups
  end

  def create
    @group = Group.find(params[:expend][:group_id].to_i)
    @expend = @group.expends.new(author_id: current_user.id, amount: params[:expend][:amount], name: params[:expend][:name])
    if @expend.save
      flash[:success] = 'expend save successfully'
      redirect_to group_expends_path(@group)
    else
      flash.now[:error] = 'Error : expend didn t save'
      render :new, locals: {expend: @expend}
    end
  end

  def require_loggin
    unless current_user
      redirect_to homes_path
    end
  end

end
