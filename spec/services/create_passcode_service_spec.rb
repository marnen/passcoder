require 'rails_helper'

describe CreatePasscodeService do
  shared_examples_for 'a passcode with line items' do
    it 'has associated line items' do
      debugger unless line_items_attributes && line_items_attributes[:item_id]
      line_items = passcode.line_items
      expect(line_items.size).to be == 1
      expect(line_items.first.attributes.symbolize_keys).to include line_items_attributes
    end
  end

  describe '.call' do
    let(:extra_attributes) { {} }
    let(:passcode_attributes) { FactoryGirl.attributes_for :passcode }
    let(:passcode) { CreatePasscodeService.call ActionController::Parameters.new passcode: passcode_attributes.merge(extra_attributes) }

    context 'with valid parameters' do
      it 'creates a passcode with the given attributes' do
        expect(passcode).to be_a_kind_of Passcode
        expect(passcode.attributes.symbolize_keys).to include passcode_attributes
      end

      context 'with line items' do
        let(:line_items_attributes) { FactoryGirl.attributes_for :line_item, item_id: FactoryGirl.create(:item).id }
        let(:extra_attributes) { {line_items_attributes: [line_items_attributes]} }

        context 'creates the line items along with the passcode' do
          it_behaves_like 'a passcode with line items'
        end
      end
    end

    context 'with invalid passcode parameters' do
      let(:line_items_attributes) { FactoryGirl.attributes_for :line_item, item_id: FactoryGirl.create(:item).id }
      let(:extra_attributes) { {code: nil, line_items_attributes: [line_items_attributes]} }

      context 'it retains the line items' do
        it_behaves_like 'a passcode with line items'
      end

      it 'retains the error messages' do
        expect(passcode.errors.messages).not_to be_empty
      end
    end
  end
end
