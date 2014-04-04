require 'spec_helper'

describe Location do
  it { should have_many :trails }
  it { should validate_presence_of :name }

end
