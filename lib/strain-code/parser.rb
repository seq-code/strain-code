require 'strain-code/number'

class StrainCode::Parser
  class << self
    def clean(numbers)
      numbers.to_s.strip.gsub(/\s+/, ' ').gsub(/ *[=;,] */, ' = ')
    end

    def parse(numbers)
      clean(numbers).split(' = ').map do |number|
        StrainCode::Number.new(number)
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
      StrainCode::Number.strain_number(number)
    end

    def catalogue(code)
      c = StrainCode::Catalogue.catalogue(code)
      c if c&.codes
    end
  end
end
