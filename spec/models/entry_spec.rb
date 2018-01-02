# spec/models/entry_spec.rb
require 'rails_helper'

RSpec.describe Entry, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:entry)).to be_valid
  end

  it "is invalid without a name" do
    entry = FactoryGirl.build(:entry, name: nil)
    expect(entry).not_to be_valid
  end

  it "has no repeated names" do
    entry = FactoryGirl.build(:entry)
    expect(Entry.where(name: entry.name).count).eql?(1)
  end

  it "is invalid without count" do
    entry = FactoryGirl.build(:entry, count: nil)
    expect(entry).not_to be_valid
  end

  it "is invalid if count is negative" do
    entry = FactoryGirl.build(:entry, count: -1)
    expect(entry).not_to be_valid
  end
end