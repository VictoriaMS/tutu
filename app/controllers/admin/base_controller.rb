class Admin::BaseController < ApplicationController
  layout 'admin'
  
  before_action :authenticate_user!
  before_action :check_admin

  protected 

  def check_admin
    redirect_to root_path, alert: 'You have not rights' unless current_user.admin?
  end
end
