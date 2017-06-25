class SiteController < ApplicationController
  def index
    if params['category']
      @accounts = Account.where("category_id = ?", params['category'].to_i)
    else
      @accounts = Account.all
    end
    @categories = Category.all
    if @accounts.empty?
      redirect_to new_account_path
    end
  end

  def show
  end
end
