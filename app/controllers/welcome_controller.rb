class WelcomeController < ApplicationController

  before_action :require_user, only: [:home]

  def index
  
  end
  
  def home
    
  end
  

end