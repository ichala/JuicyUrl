require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create!(email: 'admin@admin.com', password: 'admin123') }
  before { subject.save }

  it 'email should be present' do

    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'password should be min 6 characters' do
    subject.password = '1111'
    expect(subject).to_not be_valid
  end
end
