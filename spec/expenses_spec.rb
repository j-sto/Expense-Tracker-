require 'spec_helper'

describe Expense do
  before do
    setup
  end

describe 'initialize' do
  it "intializes the Expense with a name" do
    expect(@test_expense).to be_an_instance_of Expense
  end

  it "returns the attributes of the current category" do
    expect(@test_expense.description).to eq 'Oil Change'
    expect(@test_expense.date).to eq '2014-03-21'
  end
 end
end
