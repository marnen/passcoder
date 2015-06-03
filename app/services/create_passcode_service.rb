module CreatePasscodeService
  def self.call(params)
    Passcode.create params.require(:passcode).permit *Passcode.permitted_params
  end
end
