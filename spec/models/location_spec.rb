require 'spec_helper'

describe Location do
  it { should have_many :trails }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }

end
