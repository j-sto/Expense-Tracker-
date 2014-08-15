class Expense

  attr_reader :description, :amount, :date, :company_id

  def initialize(attributes)
    @description = attributes[:description]
    @amount = attributes[:id].to_i
    @date = attributes[:date].split(' ')[0]
    @company_id = attributes[:company_id].to_i
  end

end
