require 'spec_helper'

describe Company do
  before do
    setup
  end


 describe 'initialize' do
  it "intializes the Company with a name" do
    expect(@test_company).to be_an_instance_of Company
  end

  it "returns the attributes of the current category" do
    expect(@test_company.name).to eq 'Wal-mart'
  end
 end
end
