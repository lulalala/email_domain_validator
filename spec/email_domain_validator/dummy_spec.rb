require 'helper'
require 'email_domain_validator/dummy'

describe EmailDomainValidator::Dummy do
  let(:core){ double(:core_app) }
  subject{ described_class.new(core) }

  it 'returns true always' do
    core.should_not_receive(:valid?)

    subject.valid?('localhost').should == true
    subject.valid?('test').should == true
  end
end
