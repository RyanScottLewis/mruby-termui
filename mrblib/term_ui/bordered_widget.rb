# module MEMS
#   module Interface
#     module Text
#
#       # TODO: Functionality should be on all widgets
#       # TODO: Border size
#       # TODO: Padding size
#       # TODO: Border size should push in where the padding starts
#       class BorderedWidget < Widget
#
#         def initialize(options={})
#           super
#
#           self.border_foreground = options[:border_foreground] if options.has_key?(:border_foreground)
#           self.border_background = options[:border_background] if options.has_key?(:border_background)
#         end
#
#         # The border characters
#         def border_characters
#           @border_characters ||= {
#             tl: ?#,
#             t:  ?#,
#             tr: ?#,
#             l:  ?#,
#             r:  ?#,
#             bl: ?#,
#             b:  ?#,
#             br: ?#
#           }
#         end
#
#         # The border visibility
#         def border_visibility
#           @border_visibility ||= {
#             tl: true,
#             t:  true,
#             tr: true,
#             l:  true,
#             r:  true,
#             bl: true,
#             b:  true,
#             br: true
#           }
#         end
#
#         # Get the border foreground color of this widget
#         def border_foreground
#           return foreground if @border_foreground.nil?
#
#           @border_foreground
#         end
#
#         # Set the border foreground color of this widget
#         def border_foreground=(value)
#           raise ArgumentError, "border_foreground must respond to :to_i" unless value.respond_to?(:to_i)
#
#           @border_foreground = value.to_i
#         end
#
#         # Get the border background color of this widget
#         def border_background
#           return background if @border_background.nil?
#
#           @border_background
#         end
#
#         # Set the border background color of this widget
#         def border_background=(value)
#           raise ArgumentError, "border_background must respond to :to_i" unless value.respond_to?(:to_i)
#
#           @border_foreground = value.to_i
#         end
#
#         def draw
#           super
#
#           # Draw the corners
#           draw_cell( x: 0,       y: 0,        foreground: border_foreground, background: border_background, character: border_characters[:tl] ) if !!border_visibility[:tl]
#           draw_cell( x: width-1, y: 0,        foreground: border_foreground, background: border_background, character: border_characters[:br] ) if !!border_visibility[:tr]
#           draw_cell( x: width-1, y: height-1, foreground: border_foreground, background: border_background, character: border_characters[:br] ) if !!border_visibility[:br]
#           draw_cell( x: 0,       y: height-1, foreground: border_foreground, background: border_background, character: border_characters[:bl] ) if !!border_visibility[:bl]
#
#           # Draw the sides
#           (1..width-1).each do |x|
#             draw_cell( x: x, y: 0,        foreground: border_foreground, background: border_background, character: border_characters[:t] ) if !!border_visibility[:t]
#             draw_cell( x: x, y: height-1, foreground: border_foreground, background: border_background, character: border_characters[:b] ) if !!border_visibility[:b]
#           end
#
#           (1..height-1).each do |y|
#             draw_cell( x: width-1, y: y, foreground: border_foreground, background: border_background, character: border_characters[:l] ) if !!border_visibility[:l]
#             draw_cell( x: 0,       y: y, foreground: border_foreground, background: border_background, character: border_characters[:r] ) if !!border_visibility[:r]
#           end
#         end
#
#       end
#
#     end
#   end
# end
