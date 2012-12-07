#!/usr/bin/env ruby

ARGV = []
load File.realpath(File.dirname(__FILE__) + '/../pear-validate-dependencies')

describe "Version" do
  it "can be initialized by version string like 'major.minor.release'" do
    Version.new('1.3.0').to_s.should eq '1.3.0'
  end

  it "can be initialized by version string like 'major.minor'" do
    Version.new('1.3').to_s.should eq '1.3.0'
  end

  it "cannot be initialized from invalid version string" do
    proc {
      Version.new('')
    }.should raise_error(Exception)

    proc {
      Version.new('1')
    }.should raise_error(Exception)

    proc {
      Version.new('a')
    }.should raise_error(Exception)
  end

  it "can be compared with >= method" do
    (Version.new('0.0.1') >= Version.new('0.0.0')).should be true
    (Version.new('1.2.0') >= Version.new('1.1.0')).should be true
    (Version.new('2.0.0') >= Version.new('1.0.0')).should be true
    (Version.new('2.0.0') >= Version.new('2.0.0')).should be true
  end

  it "can be compared with <= method" do
    (Version.new('0.0.0') <= Version.new('0.0.1')).should be true
    (Version.new('1.1.0') <= Version.new('1.2.0')).should be true
    (Version.new('1.0.0') <= Version.new('2.0.0')).should be true
    (Version.new('1.0.0') <= Version.new('1.0.0')).should be true
  end

  it "can be compared with == method" do
    (Version.new('1.2.3') == Version.new('1.2.3')).should be true
  end

  it "can be compared with > method" do
    (Version.new('0.0.1') > Version.new('0.0.0')).should be true
    (Version.new('1.2.0') > Version.new('1.1.0')).should be true
    (Version.new('2.0.0') > Version.new('1.0.0')).should be true
  end

  it "can be compared with < method" do
    (Version.new('0.0.0') < Version.new('0.0.1')).should be true
    (Version.new('1.1.0') < Version.new('1.2.0')).should be true
    (Version.new('1.0.0') < Version.new('2.0.0')).should be true
  end
end
