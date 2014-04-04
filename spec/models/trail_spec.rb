require 'spec_helper'

describe Trail do
  it { should belong_to :location }
  it { should have_and_belong_to_many :tags }
  it { should validate_presence_of :name }

end
