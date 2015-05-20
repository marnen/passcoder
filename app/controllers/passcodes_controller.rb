class PasscodesController < ApplicationController
  responders :flash, :collection

  def index
    @passcodes = Passcode.includes :line_items
    respond_with @passcodes
  end

  def new
    @passcode = Passcode.new
  end

  def create
    passcode = CreatePasscodeService.call params.require(:passcode).permit(CreatePasscodeService.permitted_params).symbolize_keys
    respond_with passcode
  end
end
