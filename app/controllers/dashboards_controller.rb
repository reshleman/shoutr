class DashboardsController < ApplicationController
  def show
    @text_shout = TextShout.new
    @image_shout = ImageShout.new
    @shouts = current_user.timeline.page(params[:page])
  end
end
