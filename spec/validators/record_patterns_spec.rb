require 'spec_helper'

describe RecordPatterns do

  let(:validator) {
    Class.new.extend RecordPatterns
  }

  it "accepts valid hostnames" do
    validator.hostname?('www.example.com').should be_true
  end

  it "rejects invalid hostnames" do
    # hostname validator may need to be more strict at some point.
    validator.hostname?('').should be_false
  end

  it "accepts valid IPV4 addresses" do
    validator.ipv4?('127.1.1.0').should be_true
    validator.ipv4?('8.8.8.8').should be_true  
  end

  it "rejects invalid IPV4 addresses" do
    validator.ipv4?('3ffe:0b00:0000:0000:0001:0000:0000:000').should be_false
  end

  it "accepts valid IPV6 addresses" do
    validator.ipv6?('2001:0000:1234:0000:0000:C1C0:ABCD:0876').should be_true
    validator.ipv6?('3ffe:0b00:0000:0000:0001:0000:0000:000').should be_true
  end

  it "rejects invalid IPV6 addresses" do
    validator.ipv6?('127.1.1.0').should be_false
  end

end
