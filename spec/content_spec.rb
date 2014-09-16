require_relative 'spec_helper'

describe "Content" do
  before(:each) do
    c1 = Content.create(text: "Test text", identifier: "test-identifier")
  end
  it "should exist in the database" do
    c_lookup = Content.all
    expect(c_lookup.length).to eql(1)
  end
  it "should have text" do
    c_lookup = Content.find_by text: "Test text"
    expect(c_lookup.text).to eql("Test text")
  end
  it "should have an identifier" do
    c_lookup = Content.find_by identifier: "test-identifier"
    expect(c_lookup.identifier).to eql("test-identifier")
  end
  it "the identifier should not have any white space" do
    c1 = Content.create(identifier: "Should not work")
    c_lookup = Content.find_by identifier: "Should not work"
    expect(c_lookup).to be(nil)
  end
end

