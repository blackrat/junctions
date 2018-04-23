require 'junctions'
Junctions.core = 'common'
Junctions.junction_list = ['plastic', 'metal']
require 'common/wibble_extensions'

class Wobble
  include Common::WibbleExtensions
end
