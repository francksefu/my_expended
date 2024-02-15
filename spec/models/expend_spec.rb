require 'rails_helper'
RSpec.describe Expend, type: :model do
  subject { Expend.new(author: User.first, name: 'Manish', amount: 10, group: Group.first) }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'group should be present' do
    subject.group_id = nil
    expect(subject).to_not be_valid
  end

  it 'amount must be greater or equal to 0' do
    subject.amount = -5
    expect(subject).to_not be_valid
  end

end
