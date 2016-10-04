class Dessert

  def initialize(name, calories)
    validateName(name)
    validateCalories(calories)
    @name = name
    @calories = calories
  end
  
  # Getters
  def name
    @name
  end
  def calories
    @calories
  end
 
  # Setters
  def name=(new_name)
    validateName(new_name)
    @name = new_name
  end
  def calories=(new_calories)
    validateCalories(new_calories)
    @calories = new_calories
  end
    
  # Validators
  def validateName(name)
    if !name or (name and name.class == String and name.strip.empty?)
      raise ArgumentError
    end
  end
  def validateCalories(calories)
    raise ArgumentError unless calories.is_a? Numeric and calories > 0
  end
  
  def healthy?
    return @calories < 200
  end
  
  def delicious?
    return true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    super(name, calories)
    validateFlavor(flavor)
    @flavor = flavor
  end
  
  #Getter
  def flavor
    @flavor
  end
  
  #Setter
  def flavor=(new_flavor)
    validateFlavor(new_flavor)
    @flavor = new_flavor
  end
  
  # Validator
  def validateFlavor(flavor)
    raise ArgumentError unless flavor
  end
  
  def delicious?
    return @flavor != 'black licorice'
  end
end
