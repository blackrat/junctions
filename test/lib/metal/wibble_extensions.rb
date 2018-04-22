module Metal
  module WibbleExtensions
    def to_s
      'metal'
    end

    def metal
      "#{to_s} included too"
    end
  end
end