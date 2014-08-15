class Company
  attr_reader :name

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end


end
