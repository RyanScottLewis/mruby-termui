module TermUI
  
  # Allows an object to belong to a TermUI::Application.
  module HasApplication
    
    # Get the application of this object.
    attr_reader :application
    
    # Set the application of this object.
    def application=(value)
      raise TypeError, 'application must nil or be a TermUI::Application' unless value.nil? || value.is_a?(TermUI::Application)
      
      @application = value
      
      children.each { |child| child.application = value if child.respond_to?(:application=) } if respond_to?(:children)
      
      @application
    end
    
  end
  
end
