require 'rspec'
require 'category'
require 'company'
require 'expenses'
require 'pg'


DB = PG.connect(:dbname => 'test_exp_tracker')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM categories *;")
    DB.exec("ALTER SEQUENCE categories_id_seq RESTART WITH 1;")
    DB.exec("DELETE FROM company *;")
    DB.exec("DELETE FROM expenses*;")

  end
end

def setup
  @test_category = Category.new({:name => 'Food'})
  # @test_company = Company.new()
  # @test_expense = Expense.new()
end
