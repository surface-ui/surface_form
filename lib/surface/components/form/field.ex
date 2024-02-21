defmodule Surface.Components.Form.Field do
  @moduledoc """
  Defines a form field.

  The `Field` component sets the provided field name into the context so child
  components like input fields and labels can retrieve it and use it as
  the default field.
  """

  use Surface.Component

  @doc "The field name"
  prop name, :any, required: true

  @doc "The CSS class for the generated `<div>` element"
  prop class, :css_class

  @doc """
  The content for the field
  """
  slot default, required: true

  def render(assigns) do
    ~F"""
    <div class={class_value(@class)}>
      <#slot context_put={__MODULE__, field: @name}/>
    </div>
    """
  end

  defp class_value(class) do
    class || get_config(:default_class) || ""
  end
end
