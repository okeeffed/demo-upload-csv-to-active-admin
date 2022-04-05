class CsvHelper
  class << self
    def convert_to_templates(csv_data)
      templates = []
      csv_file = csv_data.read
      CSV.parse(csv_file) do |row|
        name, description, author = row
        templates << Template.new(name: name, description: description, author: author)
      end
      templates
    end
  end
end
