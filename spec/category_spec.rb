require 'spec_helper'

describe Category do
  before do
    setup
  end


 describe 'initialize' do
  it "intializes the category with a name" do
    expect(@test_category).to be_an_instance_of Category
  end

  it "returns the attributes of the current category" do
    expect(@test_category.name).to eq 'Food'
  end
 end


 describe 'save' do
  it 'saves the category to the database and returns the id' do
    @test_category.save
    expect(@test_category.id).to be_an_instance_of Fixnum
    end
  end

  describe 'Self.all' do
    it 'returns all of the saved categories' do
      @test_category.save
      expect(Category.all).to eq [@test_category]
    end
  end

  describe '==(another_category)' do
    it 'is true if two categories have the same attributes' do
      @test_category.save
      test_category1 = Category.new({:name => 'Food', :id => @test_category.id, :expense_id => @test_category.expense_id})
      expect(test_category1).to eq @test_category
    end
  end

end
