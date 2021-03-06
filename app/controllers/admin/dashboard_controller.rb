class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with :name => ENV["ADMIN_USERNAME"], :password => ENV["ADMIN_PASSWORD"]
  def show
    @total_products = Product.count(:name)
    @total_categories = Category.count(:name)
  end
end
