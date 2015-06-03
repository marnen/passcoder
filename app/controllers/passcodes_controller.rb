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
    @passcode = Passcode.new params.require(:passcode).permit *Passcode.permitted_params
    unless @passcode.save
      params.require(:passcode).require(:line_items_attributes).each do |line_item|
        @passcode.line_items.build line_item.permit *LineItem.permitted_params
      end
    end
    respond_with @passcode
  end
end
