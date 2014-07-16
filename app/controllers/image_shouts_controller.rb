class ImageShoutsController < ApplicationController
  def create
    image_shout = ImageShout.new(image_shout_params)
    if current_user.shouts.create(content: image_shout)
      redirect_to dashboard_path
    else
      @shouts = current_user.shouts
      render "dashboards/show"
    end
  end

  private

  def image_shout_params
    params.
      require(:image_shout).
      permit(:image)
  end
end
