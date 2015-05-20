module CreatePasscodeService
  class << self
    def call(resonator_level: nil, resonator_quantity: nil, **params)
      Passcode.transaction do
        Passcode.create!(params).tap do |passcode|
          if resonator_level.present?
            resonator = Item.find_or_create_by! name: 'Resonator'
            passcode.line_items.create! item: resonator, item_level: resonator_level, quantity: resonator_quantity
          end
        end
      end
    end

    def permitted_params
      @permitted_params ||= Passcode.permitted_params + [:resonator_level, :resonator_quantity]
    end
  end
end
