require_relative 'spec_helper'

describe "Page" do
  before(:each) do
    p1 = Page.new
    p1.title = "Test Title"
    p1.save
  end
  context "construct object" do
    let(:p1) {
      p1 = Page.new
      p1.title = "Test Title"
      return p1
    }

    it "should exist in memory" do
      expect(p1.nil?).to be(false)
    end
    it "should have a title in memory" do
      expect(p1.title).to eql("Test Title")
    end
    it "should exist in the database" do
      p_lookup = Page.all
      expect(p_lookup.length).to eql(1)
    end
    it "should have a title in the database" do
      p_lookup = Page.find_by title: "Test Title"
      expect(p_lookup.title).to eql("Test Title")
    end
    it "should not have a bogus record in the database" do
      p_lookup = Page.find_by title: "False Title"
      expect(p_lookup).to be(nil)
    end
  end
end
