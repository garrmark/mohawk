module Mohawk
  module Accessors
    class Text
      def initialize(adapter, locator)
        @adapter = adapter
        @text = adapter.window.text_field(locator)
      end

      def value
        @text.value
      end

      def set(text)
        @text.set text
      end

      def clear
        @text.clear
      end

      def enter(text)
        text_window = @adapter.window.child(:hwnd => @text.hwnd)
        text.split(//).each do |key|
          text_window.send_keys key
          sleep 0.1
        end
      end
    end
  end
end
