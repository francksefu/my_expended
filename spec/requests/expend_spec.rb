require 'rails_helper'

describe ' Controller /expends' do
  include Devise::Test::IntegrationHelpers
  let!(:user) do
    User.create(name: 'franck', email: 'franck@cg.com', password: '123456')
  end

  let!(:group) do
    Group.create(name: 'eating', icon: 'mac', user_id: user.id)
  end

  let!(:expend) do
    Expend.create(name: 'eating chicken', amount: 10, author_id: user.id, group:)
  end

  before do
    sign_in user # Authenticate the user using Devise
  end

  it 'get index for expend' do
    get "/groups/#{group.id}/expends"
    expect(response.status).to eq(200)
    expect(response.body).not_to eq nil
    expect(response).to render_template 'expends/index'
  end
end
