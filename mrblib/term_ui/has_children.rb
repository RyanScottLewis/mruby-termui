module TermUI
  
  # Allows an object to have child widgets.
  # Set's the widget's `parent` attribute to this object when it is added and set's it to nil when it is removed.
  module HasChildren
    
    def initialize(*args)
      @children = []
      
      super
    end
    
    # Get a child from it's index.
    def [](index)
      children[index]
    end
    
    # Get the children of this object.
    attr_reader :children
    
    # Add a child to this group.
    def add_child(widget)
      raise TypeError, 'widget must respond to #draw' unless widget.respond_to?(:draw)
      
      @children << widget
      
      widget
    end
    
    # alias_method :<<, :add_child
    
    # Remove a child from this object's children at the given index.
    def delete_child_at(index)
      # NOTE: All deleting uses this method so that subclasses can override default behaviour when deleting a child
      @children.delete_at(index)
    end
    
    # Remove a child from this object's children.
    def delete_child(widget)
      delete_child_at( @children.index(widget) )
    end
    
    # Remove all children.
    def delete_children
      (0...@children.count).to_a.reverse.each { |index| delete_child_at(index) }
    end
    
    protected
    
    def draw_children
      children.each(&:draw)
    end
    
    def update_children
      children.each(&:update)
    end
    
  end
  
end
