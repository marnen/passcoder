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
    respond_with Passcode.create! params.require(:passcode).permit Passcode.permitted_params
  end
end
