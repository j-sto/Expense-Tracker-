require 'spec_helper'

describe Expense do
  before do
    setup
  end

describe 'initialize' do
  it "intializes the Expense with a name" do
    expect(@test_expense).to be_an_instance_of Expense
  end

  it "returns the attributes of the current expense" do
    expect(@test_expense.description).to eq 'Oil Change'
    expect(@test_expense.date).to eq '2014-03-21'
    expect(@test_expense.amount).to eq 9.99
  end
 end

describe 'save' do
  it 'saves the expense to the database and returns the id' do
    @test_expense.save
    expect(@test_expense.id).to be_an_instance_of Fixnum
    end
  end

  describe 'Self.all' do
    it 'returns all of the saved categories' do
      @test_expense.save
      expect(Expense.all).to eq [@test_expense]
    end
  end

  describe '==(another_expense)' do
    it 'is true if two categories have the same attributes' do
      @test_expense.save
      test_expense1 = Expense.new({:description => 'Oil Change', :id => @test_expense.id, :amount => '9.99', :date => '2014-03-21'})
      expect(test_expense1).to eq @test_expense
    end
  end






end
