require_relative '../helper'
require 'email_domain_validator/core'

RSpec.describe EmailDomainValidator::Core do
  it 'returns true for valid domain' do
    subject.valid?('example.com').should == true
    subject.valid?('gmail.com').should == true
    subject.valid?('hotmail.com').should == true
    subject.valid?('yahoo.com').should == true
  end

  it 'returns true for domain with only A record but no MX record' do
    subject.valid?('lulalala.com').should == true
  end

  it 'returns false for invalid domain' do
    subject.valid?('anonymous.invalid').should == false
    subject.valid?('gmail.comm1').should == false
  end
end

