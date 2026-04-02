class AccountController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
    @provinces = Province.all.order(:name)
  end

  def update
    @user = current_user
    @provinces = Province.all.order(:name)
    if @user.update(account_params)
      redirect_to account_path, notice: "Address updated successfully!"
    else
      render :edit
    end
  end

  private

  def account_params
    params.require(:user).permit(:first_name, :last_name, :street, :city, :postal_code, :province_id)
  end
end
