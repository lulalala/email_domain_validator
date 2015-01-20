class EmailDomainValidator::Dummy
  def initialize(app, options = nil)
  end

  def valid?(domain)
    true
  end
end
