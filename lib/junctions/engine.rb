require 'active_support/inflector'

module Junctions
  class Engine
    class << self
      public
      attr_writer :junction_list, :core

      def junction_list
        @junction_list||=get_initializer_roots('junctions')
      end

      def junction_classes
        junction_list.reverse
      end

      def core
        @core||='core'
      end

      private
      def get_initializer_roots(*args)
        args.map do |arg|
          root=ENV[arg]
          root && root.split(',').map(&:squish) or nil
        end.flatten.compact << core
      end

      def switch_to_junction(junction_class, base, base_name)
        name=base_name.gsub("#{core.classify}::", "#{junction_class}::")
        begin
          require(name.underscore)
          base.instance_eval {
            include name.constantize
          } if name.gsub(/::[^:]*$/, '').constantize.const_defined?(name.demodulize)
        rescue NameError
        rescue LoadError
        rescue Exception => e
          puts(e.message)
          puts(e.backtrace)
        end unless base_name==name
      end

      public
      def activate(base, name)
        junction_classes.each { |junction_class| switch_to_junction(junction_class.classify, base, name) }
      end
    end
  end
end
