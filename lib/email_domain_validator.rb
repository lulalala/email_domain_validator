require "email_domain_validator/version"
require "email_domain_validator/core"

class EmailDomainValidator
  def initialize
    @validator = Core.new
  end

  def valid?(email)
    domain = self.class.get_domain(email)

    if domain.nil? || domain.empty?
      return false
    end

    @validator.valid?(domain)
  end

  def add_filter(filter_class, options={})
    require_path = "email_domain_validator/#{filter_class}"

    require require_path

    klass = self.class.constantize(require_path)

    @validator = klass.new(@validator, options)
  end

private

  # @email
  def self.get_domain(email)
    email[/@(.*)/,1]
  end

  def self.constantize(string)
    string.split('/').inject(Object){|o,c|
      o.const_get(c.split('_').map{|e| e.capitalize}.join)
    }
  end
end
