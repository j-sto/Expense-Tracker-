class Expense

  attr_reader :description, :id, :amount, :date, :company_id

  def initialize(attributes)
    @description = attributes[:description]
    @id = attributes[:id].to_i
    @amount = attributes[:amount].to_f
    @date = attributes[:date].split(' ')[0]
    @company_id = attributes[:company_id].to_i
  end


def save
    results = DB.exec("INSERT INTO expenses (description, amount, company_id, date) VALUES ('#{description}', #{amount}, #{company_id}, '#{date}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def self.all
    expenses =[]
    results = DB.exec("SELECT * FROM expenses;")
    results.each do |result|
      attributes = {
        :description => result['description'],
        :id => result['id'].to_i,
        :amount => result['amount'],
        :date => result['date'],
        :company_id => result['company_id']
      }
      current_expense = Expense.new(attributes)
      expenses << current_expense
    end
    expenses
  end

  def ==(another_expense)
    self.description == another_expense.description && self.id == another_expense.id && self.amount == another_expense.amount && self.date == another_expense.date && self.company_id == another_expense.company_id
  end






end
