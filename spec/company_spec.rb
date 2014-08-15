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

  describe 'save' do
  it 'saves the company to the database and returns the id' do
    @test_company.save
    expect(@test_company.id).to be_an_instance_of Fixnum
    end
  end

  describe 'Self.all' do
    it 'returns all of the saved categories' do
      @test_company.save
      expect(Company.all).to eq [@test_company]
    end
  end

  describe '==(another_company)' do
    it 'is true if two categories have the same attributes' do
      @test_company.save
      test_company = Company.new({:name => 'Wal-mart', :id => @test_company.id})
      expect(test_company).to eq @test_company
    end
  end




end
