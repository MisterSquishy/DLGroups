class HomeController < ApplicationController
  @d
  @q
  @pi
  @wm

  def index
    @pi = []
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

    respond_to do |format|
      format.js
    end
  end

  def projection_change
    tempPi = [];
    (1..@d.to_i).step(1) do |i|
      if !params[:i]["mi"].nil? && !params[:i]["mi"].empty? && numeric?(params[:i]["mi"]) && !params[:i]["li"].nil? && !params[:i]["li"].empty? && numeric?(params[:i]["li"]) then
        tempPi.push(params[:i])
      else return
      end
    end
    @pi = tempPi

    @wm = MathHelper.compute_word_metric(@pi);

    respond_to do |format|
      format.js
    end
  end
end
