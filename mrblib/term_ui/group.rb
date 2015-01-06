module TermUI
  
  class Group < Widget
    
    include HasChildren
    
    # Get the computed width of this group.
    def computed_width
      return 0 if children.empty?
      
      children.collect { |child| child.x + child.width }.max
    end
    
    # Get the computed height of this group.
    def computed_height
      return 0 if children.empty?
      
      children.collect { |child| child.y + child.height }.max
    end
    
    # Add a child to this group.
    def add_child(widget)
      widget = super
      widget.parent = self
      widget.application = application
      
      widget
    end
    
    # Remove a child from this object's children at the given index.
    def delete_child_at(index)
      widget = super
      widget.parent = nil
      widget.application = nil
      
      widget
    end
    
    # Update all child widgets.
    def update
      update_children
    end
    
    # Draw all child widgets relative to this location.
    # TODO: If the dimensions of this group of this group are less than the computed dimensions, the drawing will be clipped.
    def draw
      super
      
      draw_children
    end
    
  end
  
end
