
class StrainCode::Catalogue
  class << self
    def catalogues_path
      File.join(StrainCode.data_path, 'catalogues.yaml')
    end

    def catalogues_source
      @catalogues_source ||= YAML.load_file(
        catalogues_path,
        permitted_classes: [OpenStruct, Symbol, Date]
      )
    end

    def catalogue_hash(code)
      hsh = catalogues_source['catalogues'].find do |i|
        i['codes'].include? code.to_s.upcase
      end
    end

    def catalogue(code)
      hsh = catalogue_hash(code)
      new(hsh) if hsh
    end
  end

  attr_accessor :codes, :country_code, :name, :name_en, :organization
  attr_accessor :url, :url_pattern

  def initialize(code)
    code = self.class.catalogue_hash(code) unless code.is_a?(Hash)
    code.each { |k, v| self.send("#{k}=", v) unless k =~ /^_/ } if code
  end
end
