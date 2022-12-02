require 'rails_helper'
require 'faker'

RSpec.describe Url, type: :model do 
    subject { 
        user = User.create!(email: Faker::Internet.email, password: 'test123') 
        user.urls.create!(original_link: 'https://www.google.com', alias: 'test') 
    }

  before { subject.save }

  it 'alias should exist' do
    subject.alias = nil
    expect(subject).to_not be_valid
  end

  it 'original_link should exist' do
    subject.original_link = nil
    expect(subject).to_not be_valid
  end

end
