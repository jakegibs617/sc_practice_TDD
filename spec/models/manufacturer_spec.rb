require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
  it { should have_valid(:name).when('Nokia') }
  it { should_not have_valid(:name).when('', nil) }

  it { should have_valid(:country).when('USA') }
  it { should_not have_valid(:country).when('', nil) }

  it { should have_many(:cell_phones) }
end
