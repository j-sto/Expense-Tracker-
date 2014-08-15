class Company
  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def save
    results = DB.exec("INSERT INTO company (name) VALUES ('#{name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def self.all
    companies =[]
    results = DB.exec("SELECT * FROM company;")
    results.each do |result|
      attributes = {
        :name => result['name'],
        :id => result['id'].to_i,
      }
      current_company = Company.new(attributes)
      companies << current_company
    end
    companies
  end

  def ==(another_company)
    self.name == another_company.name && self.id == another_company.id
  end


end
