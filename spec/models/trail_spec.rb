require 'spec_helper'

describe Trail do
  it { should belong_to :location }
  it { should validate_presence_of :name }

end
