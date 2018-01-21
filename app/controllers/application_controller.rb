class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def numeric? string
    true if Float(string) rescue false
  end
end
