require 'json'

class Storage
  PEOPLE_FILE_PATH = 'people.json'.freeze
  BOOKS_FILE_PATH = 'books.json'.freeze
  RENTALS_FILE_PATH = 'rentals.json'.freeze

  def self.read_people
    read_data(PEOPLE_FILE_PATH)
  end

  def self.write_people(people)
    write_data(PEOPLE_FILE_PATH, people)
  end

  def self.read_books
    read_data(BOOKS_FILE_PATH)
  end

  def self.write_books(books)
    write_data(BOOKS_FILE_PATH, books)
  end

  def self.read_rentals
    read_data(RENTALS_FILE_PATH)
  end

  def self.write_rentals(rentals)
    write_data(RENTALS_FILE_PATH, rentals)
  end

  def self.read_data(file_path, entity_class)
    if File.exist?(file_path)
      json_data = File.read(file_path)
      data = JSON.parse(json_data, symbolize_names: true)
      data.map do |entry|
        puts "Entry contents: #{entry}"
        puts "Entity class: #{entity_class}"
  
        entity_class.new(entry[:age].to_s, entry[:name].to_s, parent_permission: entry[:parent_permission])
      end
    else
      []
    end
  end
  
  

  def self.write_data(file_path, data)
    json_data = JSON.pretty_generate(data)
    File.write(file_path, json_data)
  end
end
