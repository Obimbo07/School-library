# main.rb

require_relative 'app'
require_relative 'book'
require_relative 'student'
require_relative 'rental'
require_relative 'teacher'
require_relative 'menu'
require_relative 'storage'
require_relative 'person'

def main
  # Load people data
  people = Storage.read_data(Storage::PEOPLE_FILE_PATH, Person)

  # Other class instances initialization
  app = App.new

  # Do something with the 'people' data, like storing it in an instance variable
  app.people = people

  # Run the menu
  run_menu(app)
end

main if __FILE__ == $PROGRAM_NAME
