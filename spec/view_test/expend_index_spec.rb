require 'rails_helper'

RSpec.describe 'Groups/views', type: :feature do
  include Devise::Test::IntegrationHelpers

  let!(:user) do
    User.create(name: 'franck', email: 'franck@cg.com', password: '123456')
  end

  let!(:group) do
    Group.create(name: 'eating', icon: 'mac', user_id: user.id)
  end

  let!(:expend) do
    Expend.create(name: 'eat checken', amount: 20, author_id: user.id, group: group)
  end

  let!(:expend1) do
    Expend.create(name: 'eat beuf', amount: 10, author_id: user.id, group: group)
  end

  before do
    sign_in user # Authenticate the user using Devise
  end

  scenario 'name of groups' do
    visit group_expends_path(group)
    expect(page).to have_content(expend.name)
    expect(page).to have_content(expend1.name)
  end

  scenario 'amount of expends' do
    visit group_expends_path(group)
    expect(page).to have_content(expend.amount)
    expect(page).to have_content(expend1.amount)
  end

  scenario 'name of groups' do
    visit group_expends_path(group)
    expect(page).to have_content(group.name)
  end

end
