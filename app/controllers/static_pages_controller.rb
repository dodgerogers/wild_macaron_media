class StaticPagesController < ApplicationController
  
  def home
    render layout: "front"
  end
end