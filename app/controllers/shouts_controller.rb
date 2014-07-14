class ShoutsController < ApplicationController
  def create
    user = current_user
    shout_params_with_user = shout_params.merge(user_id: user.id)
    @shout = Shout.new(shout_params_with_user)

    if @shout.save
      redirect_to root_path
    else
      @shouts = current_user.shouts
      render "dashboards/show"
    end
  end

  private

  def shout_params
    params.
      require(:shout).
      permit(:content)
  end
end
