module TermUI
  module Event
    
    # Dispatched when the terminal is resized.
    class Resize < Base
      
      include HasDimensions
      
    end
    
  end
end
