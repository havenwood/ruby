require_relative '../../spec_helper'
require_relative 'fixtures/classes'

describe "Hash#clear" do
  it "removes all key, value pairs" do
    h = { 1 => 2, 3 => 4 }
    h.clear.should equal(h)
    h.should == {}
  end

  it "does not remove default values" do
    h = Hash.new(5)
    h.clear
    h.default.should == 5

    h = { "a" => 100, "b" => 200 }
    h.default = "Go fish"
    h.clear
    h["z"].should == "Go fish"
  end

  it "does not remove default procs" do
    h = Hash.new { 5 }
    h.clear
    h.default_proc.should_not == nil
  end

  it "raises a FrozenError if called on a frozen instance" do
    -> { HashSpecs.frozen_hash.clear  }.should raise_error(FrozenError)
    -> { HashSpecs.empty_frozen_hash.clear }.should raise_error(FrozenError)
  end

  it "does not accept positional arguments" do
    -> { { a: 1 }.clear(true) }.should raise_error(ArgumentError)
  end

  it "accepts preserve_capacity keyword argument" do
    h = { a: 1, b: 2, c: 3 }
    h.clear(preserve_capacity: true).should equal(h)
    h.should == {}
  end

  it "raises ArgumentError for unknown keyword arguments" do
    -> { { a: 1 }.clear(unknown: true) }.should raise_error(ArgumentError, /unknown keyword/)
  end
end
