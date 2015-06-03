class PasscodesController < ApplicationController
  responders :flash, :collection

  def index
    @passcodes = Passcode.with_items
    respond_with @passcodes
  end

  def new
    @passcode = Passcode.new_with_line_items
  end

  def create
    passcode = Passcode.create! params.require(:passcode).permit *Passcode.permitted_params
    respond_with passcode
  end
end
