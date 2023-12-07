class Nameable
  def correct_name
    raise NotImplementedError, 'Subclasses must implement the correct_name method'
  end
end

class NameableDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < NameableDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < NameableDecorator
  MAX_LENGTH = 10

  def correct_name
    trimmed_name = @nameable.correct_name[0, MAX_LENGTH]
    trimmed_name.sub!(/\s\w*\z/, '')
    trimmed_name
  end
end

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(id, name = 'Unknown', age: nil, parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age.to_i >= 18
  end
end
