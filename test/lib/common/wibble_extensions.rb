module Common
  module WibbleExtensions
    include Junctions
    class << self
      def included(base)
        Junctions::activate(base, self.name)
      end
    end

    def to_s
      'wibble_extensions'
    end
  end
end