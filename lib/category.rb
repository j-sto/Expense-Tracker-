class Category
  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id].to_i
  end

  def save
    results = DB.exec("INSERT INTO categories (name) VALUES ('#{name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def self.all
    categories =[]
    results = DB.exec("SELECT * FROM categories;")
    results.each do |result|
      attributes = {
        :name => result['name'],
        :id => result['id'].to_i
      }
      current_category = Category.new(attributes)
      categories << current_category
    end
    categories
  end

  def ==(another_category)
    self.name == another_category.name && self.id == another_category.id
  end

end
