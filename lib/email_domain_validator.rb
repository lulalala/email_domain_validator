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
    @validator = filter_class.new(@validator, options)
  end

private

  # @email
  def self.get_domain(email)
    email[/@(.*)/,1]
  end
end
