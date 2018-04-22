module Common
  module WibbleExtensions
    class << self
      def included(base)
        module_name=self.name
        base.class_eval do
          Junctions::activate(base, module_name)
        end
      end
    end

    def to_s
      'wibble_extensions'
    end
  end
end