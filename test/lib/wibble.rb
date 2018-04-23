require 'junctions'
Junctions::Engine.core = 'common'
Junctions::Engine.junction_list = ['metal']
require 'common/wibble_extensions'

class Wibble
  include Common::WibbleExtensions
end
