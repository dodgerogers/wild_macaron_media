class PagesController < ApplicationController
  authorize_resource class: false, except: :home
  
  def home
    render layout: "front"
  end
  
  def dashboard
  end
end