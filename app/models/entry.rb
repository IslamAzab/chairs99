require 'csv_import'
class Entry < ApplicationRecord
  include CsvImport
end
