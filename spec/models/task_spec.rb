require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#title' do
    it "should require a valid title" do
      expect(Task.new(title: 'Anything', deadline: '2018-12-22 08:11:00')).to be_valid
    end
    it "should not have blank title" do
      expect(Task.new(title: '', deadline: '2018-12-22 08:11:00')).to_not be_valid
    end
  end

  describe '#deadline' do
    it "has a valid date" do
      expect(Task.new(title: 'Anything', deadline: '2018-12-22 08:11:00')).to be_valid
    end
    it 'has a invalid date' do
      expect(Task.new(title: 'Anything', deadline: '2007-12-22 08:11:00')).not_to be_valid
    end
  end

  describe '#state' do
    before(:each) do
      @task = Task.create(title:"xxx", content:"oooo", deadline:"2018-12-22 08:11:00")
    end
    it 'is default state' do
      expect(@task.state).to eq('todo')
    end
    it 'should change state' do
      @task.processing!
      expect(@task).to be_valid
      @task.save
      expect(@task.state).to eq('processing')
      @task.done!
      expect(@task).to be_valid
      @task.save
      expect(@task.state).to eq('done')
    end
  end

  describe '#priority' do
    before(:each) do
      @task = Task.create(title:"xxx", deadline:"2018-12-22 08:11:00")
    end
    it 'is default priority' do
      expect(@task.priority).to eq('high')
    end
    it 'should change priority' do
      @task.medium!
      expect(@task).to be_valid
      @task.save
      expect(@task.priority).to eq('medium')
      @task.low!
      expect(@task).to be_valid
      @task.save
      expect(@task.priority).to eq('low')
    end
  end
  
end