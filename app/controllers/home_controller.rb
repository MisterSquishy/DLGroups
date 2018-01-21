class HomeController < ApplicationController
  @validParams
  @d
  @q

  def index
    render :action => 'index', :locals => {
      d: @d,
      q: @q,
      validParams: @validParams
    }
  end

  def param_change
    if !params[:d].nil? && numeric?(params[:d]) then
      @d = params[:d].to_i
    end
    if !params[:q].nil? && numeric?(params[:q]) then
      @q = params[:q].to_i
    end

    @validParams = (@d.is_a? Integer) && (@q.is_a? Integer)

    respond_to do |format|
      format.js
    end
  end
end
