module TermUI
  
  # Allows an object to have a parent.
  module HasParent
    
    # Get/set the parent of this object.
    # It's not recommended to set this directly as it will break the ancestory chain.
    # 
    # @return [Object]
    attr_accessor :parent
    
    # Get the ancestors of this object.
    # 
    # @return [Array<Object>]
    def ancestors
      ancestors = []
      current_ancestor = self
      
      while !current_ancestor.nil?
        
        if current_ancestor.respond_to?(:parent)
          ancestors << current_ancestor
          current_ancestor = current_ancestor.parent
        else
          current_ancestor = nil
        end
        
      end
      
      ancestors
    end
    
  end
  
end
