require 'rails_helper'

RSpec.describe CellPhone, type: :model do
  it { should have_valid(:year).when(2008) }
  it { should_not have_valid(:year).when(1923, '', nil) }

  it { should have_valid(:battery_life).when('low') }
  it { should_not have_valid(:battery_life).when('', nil) }

  it { should have_valid(:description).when('USA') }

  it { should belong_to(:manufacturer) }
end
