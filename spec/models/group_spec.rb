require 'rails_helper'
RSpec.describe Group, type: :model do
  subject { Group.new(name: 'mock group', icon: 'mock icon') }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'icon should be present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

end
