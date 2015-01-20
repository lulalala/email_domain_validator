require 'helper'
require 'email_domain_validator/rails_cache'

dummy_cache = Object.new
def dummy_cache.valid?; end
def dummy_cache.post_check; end

module Rails
  class DummyCache
    def read(key)
      store[key]
    end

    def write(key, value, options)
      store[key] = value
    end

    def store
      @store ||= {}
    end
  end

  def self.cache
    @cache ||= DummyCache.new
  end

  def self.reset
    @cache = DummyCache.new
  end
end

describe EmailDomainValidator::RailsCache do
  let(:core){ double(:core_app) }
  subject{ described_class.new(core) }

  before do
    Rails.reset
  end

  it 'returns true if cached' do
    Rails.cache.write(described_class.cache_key('localhost'), true, nil)

    core.should_not_receive(:valid?)

    subject.valid?('localhost').should == true
  end

  it 'caches result' do
    core.stub(:valid?){ true }

    subject.valid?('localhost')

    Rails.cache.read(described_class.cache_key('localhost')).should == true
  end
end
