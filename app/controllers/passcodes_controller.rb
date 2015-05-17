class PasscodesController < ApplicationController
  responders :flash, :collection

  def index
    @passcodes = Passcode.all
    respond_with @passcodes
  end

  def new
    @passcode = Passcode.new
  end

  def create
    respond_with Passcode.create! params.require(:passcode).permit(:code, :xm)
  end
end
