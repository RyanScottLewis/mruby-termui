MRuby::Gem::Specification.new('mruby-termui') do |spec|
  spec.authors = 'Ryan Scott Lewis <ryanscottlewis@lewis-software.com>'
  spec.summary = 'An MRuby Text-based User Interface (TUI) library based on mruby-termbox.'
  spec.license = 'MIT'
  spec.version = '0.1.0'
  
  spec.add_dependency('mruby-termbox', '~> 0.1.0')
  
  spec.rbfiles << "#{dir}/mrblib/term_ui.rb"
  
  spec.rbfiles << "#{dir}/mrblib/term_ui/has_attributes.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/has_application.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/has_borders.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/has_children.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/has_coordinates.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/has_dimensions.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/has_events.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/has_foreground_and_background.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/has_margins.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/has_orientation.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/has_padding.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/has_parent.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/has_relative_coordinates.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/has_side_attributes.rb"
  
  spec.rbfiles << "#{dir}/mrblib/term_ui/event/dispatcher.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/event/handler.rb"
  
  spec.rbfiles << "#{dir}/mrblib/term_ui/event.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/event/base.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/event/focus.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/event/key_down.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/event/resize.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/event/selected.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/event/unfocus.rb"
  
  spec.rbfiles << "#{dir}/mrblib/term_ui/cursor.rb"
  
  spec.rbfiles << "#{dir}/mrblib/term_ui/borders.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/margins.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/offsets.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/padding.rb"
  
  spec.rbfiles << "#{dir}/mrblib/term_ui/widget.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/group.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/pack.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/label.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/button.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/textbox.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/scrollbar.rb"
  spec.rbfiles << "#{dir}/mrblib/term_ui/listbox.rb"
  
  spec.rbfiles << "#{dir}/mrblib/term_ui/application.rb"
end
