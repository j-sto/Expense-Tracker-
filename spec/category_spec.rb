require 'spec_helper'

describe Category do
  before do
    setup
  end


 describe "initialize" do
  it "intializes the category with a name" do
    expect(@test_category).to be_an_instance_of Category
  end

  it "it returns the attributes of the current category" do
    expect(@test_category.name).to eq 'Food'
  end
 end
end
