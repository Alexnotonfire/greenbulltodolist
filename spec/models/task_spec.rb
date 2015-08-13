require 'spec_helper'

describe Task do

  it "has a valid factory" do
    expect(FactoryGirl.create(:task)).to be_valid
  end

  describe "validations" do
    it {should validate_presence_of(:title).on(:create)}
    it {should validate_length_of(:title).on(:create)}
    it {should validate_numericality_of(:priority)}
  end

    it "returns highest priority" do
      task = FactoryGirl.create(:task, priority: "5").set_maximum_priority
      expect(task.priority).to eq(6)
    end

end
