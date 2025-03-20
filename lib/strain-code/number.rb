class StrainCode::Number
  attr_accessor :ori_number, :code, :accession

  class << self
    def strain_number(number)
      new(StrainCode::Parser.clean(number))
    end
  end

  def initialize(number)
    @ori_number = number.to_s.strip
    @code, @accession = ori_number.split(/[ :_]+/, 2)
    @code, @accession = @accession, @code if @accession.nil?
  end

  def number
    catalogue ? [code, accession].compact.join(' ') : ori_number
  end

  def url
    catalogue.url_pattern % accession if catalogue&.url_pattern
  end

  def catalogue
    @catalogue ||= StrainCode.catalogue(code)
  end

  def to_s
    number
  end
end
