require 'rails_helper'

RSpec.describe 'Groups/views', type: :feature do
  include Devise::Test::IntegrationHelpers

  let!(:user) do
    User.create(name: 'franck', email: 'franck@cg.com', password: '123456')
  end

  let!(:group) do
    Group.create(name: 'eating', icon: 'mac', user_id: user.id)
  end

  let!(:group2) do
    Group.create(name: 'eating2', icon: 'taxi', user_id: user.id)
  end

  let!(:group3) do
    Group.create(name: 'eating3', icon: 'san', user_id: user.id)
  end

  before do
    sign_in user # Authenticate the user using Devise
  end

  scenario 'total amount of groups' do
    visit groups_path
    expect(page).to have_content(group.expends.where(author_id: user.id).sum(:amount))
    expect(page).to have_content(group2.expends.where(author_id: user.id).sum(:amount))

  end

  scenario 'name of group' do
    visit groups_path
    expect(page).to have_content(group.name)
    expect(page).to have_content(group2.name)
    expect(page).to have_content(group3.name)
  end

  scenario 'check link' do
    visit groups_path
    click_link group3.name
    expect(page).to have_current_path(group_expends_path(group3))
  end

  scenario 'check link' do
    visit groups_path
    click_link group2.name
    expect(page).to have_current_path(group_expends_path(group2))
  end

end
