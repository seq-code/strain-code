require 'strain_code/strain_number'

class StrainCode::Parser
  class << self
    def clean(numbers)
      numbers.to_s.strip.gsub(/\s+/, ' ').gsub(/ *[=;,] */, ' = ')
    end

    def parse(numbers)
      clean(numbers).split(' = ').map do |number|
        StrainCode::StrainNumber.new(number)
      end
    end
  end
end

class StrainCode
  class << self
    def parse(numbers)
      StrainCode::Parser.parse(numbers)
    end

    def number(number)
      StrainCode::StrainNumber.strain_number(number)
    end

    def catalogue(code)
      c = StrainCode::Catalogue.catalogue(code)
      c if c&.codes
    end
  end
end
