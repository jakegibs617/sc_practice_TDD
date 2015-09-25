require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:email).when('jasdk@email.com') }
  it { should_not have_valid(:email).when('', nil) }

  context 'uniqueness' do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:dupe_user) { FactoryGirl.build(:user) }

    it 'requires a unique email' do
      dupe_user.email = user.email
      expect(dupe_user).to_not be_valid
      expect(dupe_user.errors[:email]).to_not be_empty
    end
  end
end
