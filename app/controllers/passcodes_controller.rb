class PasscodesController < ApplicationController
  responders :flash, :collection

  def index
    @passcodes = Passcode.includes line_items: :item
    respond_with @passcodes
  end

  def new
    @passcode = Passcode.new
    @passcode.line_items.build
    @items = Item.all
  end

  def create
    passcode = Passcode.create! params.require(:passcode).permit *Passcode.permitted_params
    respond_with passcode
  end
end
