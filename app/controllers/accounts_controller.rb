class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
     @accounts = Account.all
    @categories = Category.all
    if @accounts.empty?
      redirect_to new_account_path
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
     @accounts = Account.all
    @categories = Category.all
  end

  # GET /accounts/new
  def new
    @account = Account.new
     @accounts = Account.all
    @categories = Category.all
  end

  # GET /accounts/1/edit
  def edit
     @accounts = Account.all
    @categories = Category.all
  end

  # POST /accounts
  # POST /accounts.json
  def create
    require 'cryptosystem'
    rsa = Cryptosystem::RSA.new
    ap = account_params
    ap[:password] = rsa.encrypt(ap[:password])
    @account = Account.new(ap)
   
    respond_to do |format|
      if @account.save
        format.html { redirect_to '/dashboard', notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    require 'cryptosystem'
    respond_to do |format|
      if account_params[:password_changed]
        rsa = Cryptosystem::RSA.new
        ap = account_params
        ap[:password] = rsa.encrypt(ap[:password])
        
      else
        ap = account_params
        ap[:password] = @account.password
      end
      if @account.update(ap)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end
    
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:username, :password, :tags, :comments, :comment_percentage, :instagram_token, :category_id, :amount, :password_changed)
    end
end
