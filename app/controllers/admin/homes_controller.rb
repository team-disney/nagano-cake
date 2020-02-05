class Admin::HomesController < ApplicationController
  before_action :authenticate_admin_user!
  
  def index
    # created_at が今日に該当するデータのみを取り出す
    @orders = Order.where(created_at: (Time.zone.today.beginning_of_day)..(Time.zone.today.end_of_day))
  end
end
