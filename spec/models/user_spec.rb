require 'rails_helper'

RSpec.describe User, type: :model do
  it 'works' do
    expect(User.create(email: 'foo@example.com')).to be_truthy
  end
end
