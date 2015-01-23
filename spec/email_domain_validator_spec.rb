require 'helper'
require 'email_domain_validator'
require 'email_domain_validator/dummy'

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

  describe '#add_filter' do
    it 'wraps middleware with another middleware' do
      EmailDomainValidator::Dummy.any_instance.should_receive :valid?

      subject.add_filter(:dummy)

      subject.valid?('test@localhost')
    end
  end

  describe '.constantize' do
    it 'returns middleware constant' do
      described_class.send(:constantize, 'email_domain_validator/dummy').should == EmailDomainValidator::Dummy
    end
  end
end
