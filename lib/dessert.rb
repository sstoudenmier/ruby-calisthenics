class Dessert
  
  attr_accessor :name
  attr_accessor :calories
  
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  def healthy?
    @calories < 200
  end
  def delicious?
    true
  end
end

class JellyBean < Dessert
  def initialize(flavor)
    @name = "#{flavor} jelly bean"
    @flavor = flavor
    if flavor != "licorice"
      @calories = 5
    end
  end
  def delicious?
    @flavor != "licorice"
  end
end
