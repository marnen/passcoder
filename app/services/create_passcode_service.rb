module CreatePasscodeService
  def self.call(params)
    Passcode.create(params.require(:passcode).permit *Passcode.permitted_params).tap do |passcode|
      passcode.line_items.build if passcode.line_items.empty?
    end
  end
end
