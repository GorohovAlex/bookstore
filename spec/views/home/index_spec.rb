describe 'home/index.html.haml' do
  it 'has slider' do
    render
    expect(rendered).to have_selector('#slider')
  end
end
