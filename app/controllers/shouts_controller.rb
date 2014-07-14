class ShoutsController < ApplicationController
  def create
    if current_user.shouts.create(shout_params)
      redirect_to dashboard_path
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
