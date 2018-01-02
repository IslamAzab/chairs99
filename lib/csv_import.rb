require 'csv'
module CsvImport
  module ClassMethods
    def import(file)
      part_numbers = []
      CSV.foreach(file.path, headers: true, header_converters: [:downcase, :symbol]) do |row|
        row = row.to_h
        begin
          obj = self.find_or_initialize_by(name: row[:first_name])
          obj.increment!(:count)
          obj.save!
        rescue Exception => e
          puts e.message
        end
      end
    end
  end

  module InstanceMethods
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end