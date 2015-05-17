Given 'no passcodes exist' do
  Passcode.destroy_all
end

Then 'I should see passcode "$code" with $xm XM' do |code, xm|
  within '.passcode' do
    expect(page).to have_selector '.code', text: code
    expect(page).to have_selector '.xm', text: xm
  end
end
