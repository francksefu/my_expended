require 'rails_helper'

describe ' Controller /groups' do
  include Devise::Test::IntegrationHelpers
  let!(:user) do
    User.create(name: 'franck', email: 'franck@cg.com', password: '123456')
  end

  let!(:group) do
    Group.create(name: 'eating', icon: 'mac', user_id: user.id)
  end

  before do
    sign_in user # Authenticate the user using Devise
  end

  it 'get index for group' do
    get '/groups'
    expect(response.status).to eq(200)
    expect(response.body).not_to eq nil
    expect(response).to render_template 'groups/index'
  end

end
