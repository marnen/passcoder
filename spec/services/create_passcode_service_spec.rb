require 'rails_helper'

describe CreatePasscodeService do
  let(:extra_params) { {} }
  let(:params) { FactoryGirl.attributes_for(:passcode).merge! extra_params }
  let(:call!) { CreatePasscodeService.call params }

  describe '.call' do
    it 'creates a passcode with the supplied parameters' do
      expect(Passcode).to receive(:create!).with(params).and_return true

      call!
    end

    describe 'resonator fields' do
      context 'blank' do
        let(:extra_params) { {resonator_level: ' ', resonator_quantity: ' '} }

        it 'treats them as if they are nil' do
          expect { call! }.not_to change { LineItem.count }
        end
      end

      context 'present' do
        let(:passcode) { Passcode.find_by_code params[:code] }
        let(:line_item) { passcode.line_items.find_by item: resonator, item_level: resonator_level, quantity: resonator_quantity }
        let(:resonator_level) { rand 1..8 }
        let(:resonator_quantity) { rand 100 }
        let(:extra_params) do
          {resonator_level: resonator_level, resonator_quantity: resonator_quantity}
        end
        let(:prepare!) { }

        before(:each) do
          # TODO: this is a hack since let! doesn't seem to let us control the order precisely
          prepare!
          call!
        end

        context 'resonator item not defined' do
          let(:resonator) { Item.find_by_name 'Resonator' }

          it 'creates a resonator item' do
            expect(resonator).to be_present
          end

          it 'uses that resonator to create a line item for the passcode' do
            expect(line_item).to be_present
          end
        end

        context 'resonator item defined' do
          let(:resonator) { Item.create! name: 'Resonator'}
          let(:prepare!) { resonator }

          it 'does not create another resonator item' do
            expect(Item.count name: 'Resonator').to be == 1
          end

          it 'uses the existing resonator to create a line item for the passcode' do
            expect(line_item).to be_present
          end
        end

        context 'error handling' do
          let(:prepare!) { allow(Item).to receive(:find_or_create_by!).and_raise ActiveRecord::Rollback }

          it 'rolls the whole operation back on failure' do
            expect(Passcode.count code: params[:code]).to be_zero
          end
        end

        it 'returns the passcode' do
          expect(call!).to be == passcode
        end
      end
    end
  end

  describe '.permitted_params' do
    subject { CreatePasscodeService.permitted_params }

    [:code, :ap, :xm, :resonator_level, :resonator_quantity].each do |field|
      it { should include field }
    end
  end
end
