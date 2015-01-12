require 'helper'
require 'email_domain_validator'

describe EmailDomainValidator do
  it 'has version' do
    described_class.const_get('VERSION').empty?.should == false
  end

  it 'returns false if domain cannot be extracted from provided email address' do
    subject.valid?('not_email_address').should == false
    subject.valid?('').should == false
  end

  describe '.get_domain' do
    it 'fetches domain from email address' do
      described_class.send(:get_domain, 'akira@gmail.com').should == 'gmail.com'
      described_class.send(:get_domain, 'saki@yahoo.co.jp').should == 'yahoo.co.jp'
      described_class.send(:get_domain, 'pants+spam@scipkr.co.jp').should == 'scipkr.co.jp'
    end
  end
end
