class TextShoutsController < ApplicationController
  def create
    text_shout = TextShout.new(text_shout_params)
    if current_user.shouts.create(content: text_shout)
      redirect_to dashboard_path
    else
      @shouts = current_user.shouts
      render "dashboards/show"
    end
  end

  private

  def text_shout_params
    params.
      require(:text_shout).
      permit(:body)
  end
end
