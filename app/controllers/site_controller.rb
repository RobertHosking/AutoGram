class SiteController < ApplicationController
  def index
    @accounts = Account.all
    if @accounts.empty?
      redirect_to new_account_path
    end
  end

  def show
  end
end
