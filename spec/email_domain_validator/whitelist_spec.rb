require 'helper'
require 'email_domain_validator/whitelist'

describe EmailDomainValidator::Whitelist do
  let(:core){ double(:core_app) }
  subject{
    described_class.new(core, ['gmail.com', 'yahoo.com.tw'])
  }

  it 'returns true if in whitelist' do
    core.should_not_receive(:valid?)

    subject.valid?('gmail.com').should == true
    subject.valid?('yahoo.com.tw').should == true
  end

  it 'calls inner app if not in whitelist' do
    core.should_receive(:valid?)

    subject.valid?('yahoo.co.uk')
  end
end
