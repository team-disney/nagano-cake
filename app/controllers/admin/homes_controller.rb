class Admin::HomesController < ApplicationController
  before_action :authenticate_admin_user!
  
  def index
    @orders = EndUser.all
    # created_at が今日に該当するデータのみを取り出す
    @orders = EndUser.where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight)
  end
end
