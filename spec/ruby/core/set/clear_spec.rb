require_relative '../../spec_helper'

describe "Set#clear" do
  before :each do
    @set = Set["one", "two", "three", "four"]
  end

  it "removes all elements from self" do
    @set.clear
    @set.should be_empty
  end

  it "returns self" do
    @set.clear.should equal(@set)
  end

  it "does not accept positional arguments" do
    -> { @set.clear(true) }.should raise_error(ArgumentError)
  end

  it "accepts preserve_capacity keyword argument" do
    @set.clear(preserve_capacity: true).should equal(@set)
    @set.should be_empty
  end

  it "raises ArgumentError for unknown keyword arguments" do
    -> { @set.clear(unknown: true) }.should raise_error(ArgumentError, /unknown keyword/)
  end
end
