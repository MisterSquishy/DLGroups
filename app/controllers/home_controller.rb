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
    params["pi"].each do |i|
      pair = params["pi"][i]
      if !pair["mi"].nil? && !pair["mi"].empty? && numeric?(pair["mi"]) && !pair["li"].nil? && !pair["li"].empty? && numeric?(pair["li"]) then
        tempPi.push({:mi => pair["mi"].to_i, :li => pair["li"].to_i})
      else return
      end
    end
    @pi = tempPi

    @wm = MathHelper.compute_word_length(@pi);

    respond_to do |format|
      format.js
    end
  end
end
