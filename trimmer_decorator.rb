require_relative 'NameableDecorator'

class TrimmerDecorator < NameableDecorator
  def correct_name
    trimmed_name = @nameable.correct_name[0, 10]
    trimmed_name.sub!(/\s\w*\z/, '')
    trimmed_name
  end
end
