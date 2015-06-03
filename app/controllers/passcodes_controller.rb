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
    passcode_params = params.require(:passcode).permit *Passcode.permitted_params
    @passcode = Passcode.new passcode_params
    unless @passcode.save
      passcode_params[:line_items_attributes].each do |line_item|
        @passcode.line_items.build line_item
      end
    end
    respond_with @passcode
  end
end
