require_relative '../../spec_helper'
require_relative 'fixtures/classes'

describe "Array#clear" do
  it "removes all elements" do
    a = [1, 2, 3, 4]
    a.clear.should equal(a)
    a.should == []
  end

  it "returns self" do
    a = [1]
    a.should equal a.clear
  end

  it "leaves the Array empty" do
    a = [1]
    a.clear
    a.should.empty?
    a.size.should == 0
  end

  it "does not accept positional arguments" do
    -> { [1].clear(true) }.should raise_error(ArgumentError)
  end

  it "accepts preserve_capacity keyword argument" do
    a = [1, 2, 3]
    a.clear(preserve_capacity: true).should equal(a)
    a.should == []
  end

  it "raises ArgumentError for unknown keyword arguments" do
    -> { [1].clear(unknown: true) }.should raise_error(ArgumentError, /unknown keyword/)
  end

  it "raises a FrozenError on a frozen array" do
    a = [1]
    a.freeze
    -> { a.clear }.should raise_error(FrozenError)
  end
end
