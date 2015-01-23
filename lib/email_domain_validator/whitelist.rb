class EmailDomainValidator::Whitelist
  def initialize(app, whitelist = [])
    @app = app
    @whitelist = whitelist
  end

  def valid?(domain)
    if @whitelist.include?(domain)
      true
    else
      @app.valid?(domain)
    end
  end
end
