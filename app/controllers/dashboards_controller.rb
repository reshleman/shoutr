class DashboardsController < ApplicationController
  def show
    @shout = TextShout.new
    @shouts = current_user.timeline
  end
end
