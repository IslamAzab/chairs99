require 'csv_import'
class Entry < ApplicationRecord
  include CsvImport

  validates :name, uniqueness: true, presence: true
  validates :count, numericality: { greater_than: 0 }
end
