defmodule Surface.Components.Events do
  @moduledoc false

  defmacro __using__(_) do
    quote do
      @doc "Triggered when the component receives click"
      prop click, :event

      @doc "Triggered when a click event happens outside of the element"
      prop click_away, :event

      # TODO: Remove this when LV min is >= v0.20.15
      @doc "Triggered when the component captures click"
      prop capture_click, :event

      @doc "Triggered when the component loses focus"
      prop blur, :event

      @doc "Triggered when the component receives focus"
      prop focus, :event

      @doc "Triggered when the page loses focus"
      prop window_blur, :event

      @doc "Triggered when the page receives focus"
      prop window_focus, :event

      @doc "Triggered when a key on the keyboard is pressed"
      prop keydown, :event

      @doc "Triggered when a key on the keyboard is released"
      prop keyup, :event

      @doc "Triggered when a key on the keyboard is pressed (window-level)"
      prop window_keydown, :event

      @doc "Triggered when a key on the keyboard is released (window-level)"
      prop window_keyup, :event

      @doc "List values that will be sent as part of the payload triggered by an event"
      prop values, :keyword, default: []
    end
  end
end
