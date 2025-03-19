require 'yaml'
require 'ostruct'
require 'strain-code/version'
require 'strain-code/catalogue'

class StrainCode
  class << self
    def root_path
      File.expand_path('../../..', __FILE__)
    end

    def data_path
      File.join(root_path, 'data')
    end
  end
end
