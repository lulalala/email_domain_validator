class EmailDomainValidator::RailsCache
  def initialize(app, options = {})
    @app = app
    @options = options
  end

  def valid?(domain)
    result = Rails.cache.read(self.class.cache_key(domain))
    if result.nil?
      result = @app.valid?(domain)
      Rails.cache.write(self.class.cache_key(domain), result, @options)
    end
    result
  end

  def self.cache_key(domain)
    [:email_domain_validator, domain]
  end
end
