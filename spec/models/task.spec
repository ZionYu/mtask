require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#title' do
    it "should require a valid title" do
      expect(Task.new(title: 'Anything')).to be_valid
    end
    it "should not have blank title" do
      expect(Task.new(title: '')).to_not be_valid
    end
  end 
end