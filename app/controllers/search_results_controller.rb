class SearchResultsController < ApplicationController
  def show
    @query = params[:query]
    @shouts = Shout.search(@query).page(params[:page])
  end
end
