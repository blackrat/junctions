require 'active_support/inflector'
module Junctions
  class Engine
    class << self
      public
      attr_accessor :junction_list, :core

      def junction_list
        @junction_list||=get_initializer_roots('junctions')
      end

      def core
        @core||='core'
      end

      private
      def get_initializer_roots(*args)
        args.map do |arg|
          root=ENV[arg]
          root && root.split(',') or nil
        end.flatten.compact << core
      end

      def junction_classes
        junction_list.reverse
      end

      def switch_to_junction(junction_class, base, base_name)
        name=base_name.gsub("#{core.classify}::", "#{junction_class}::")
        begin
          require(name.underscore)
          base.instance_eval {
            include name.constantize
          } if name.gsub(/::[^:]*$/, '').constantize.const_defined?(name.demodulize)
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

    private
    def for_all_junctions_reversed(&blk)
      junction_list.reverse.each do |junction|
        yield junction
      end
    end

    def for_all_junctions(&blk)
      junction_list.each do |junction|
        yield junction
      end
    end

    public
    def junction_list
      self.class.junction_list
    end
  end
end
