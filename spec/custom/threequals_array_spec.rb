require 'spec_helper'

describe ThreequalsArray do

  it "should match a single object" do
    (t[String] === "foo").must_equal true
    (t[Fixnum] === "foo").wont_equal true
  end

  it "should work with simple case statements" do
    case "foo"
    when t[Fixnum] then false
    when t[String] then true
    when t[Object] then false
    end.must_equal true
  end

  it "should handle nils" do
    (t[] === nil).wont_equal true
  end

  it "should match multiple objects" do
    (t[String, Fixnum] === ["foo", 123]).must_equal true
    (t[Fixnum, String] === ["foo", 123]).wont_equal true
  end

  it "should work with more complicated case statements" do
    case ["foo", 123]
    when t[Fixnum] then false
    when t[String] then false
    when t[Object] then false
    when t[Fixnum, String] then false
    when t[String, Fixnum] then true
    when t[Object, Object] then false
    end.must_equal true
  end

end
