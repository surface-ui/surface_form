defmodule Surface.Components.Form.Input do
  @moduledoc false

  alias Surface.Components.Context

  defmacro __using__(_) do
    quote do
      use Surface.Component
      use Surface.Components.Events

      import unquote(__MODULE__)
      alias Surface.Components.Form.Input.InputContext

      @doc "An identifier for the form"
      prop form, :form, from_context: {Surface.Components.Form, :form}

      @doc "An identifier for the input"
      prop field, :any, from_context: {Surface.Components.Form.Field, :field}

      @doc "The id of the corresponding input field"
      prop id, :string

      @doc "The name of the corresponding input field"
      prop name, :string

      @doc "Value to pre-populated the input"
      prop value, :string

      @doc "Class or classes to apply to the input"
      prop class, :css_class

      @doc "Options list"
      prop opts, :keyword, default: []
    end
  end

  defmacro get_default_class() do
    quote do
      unquote(__MODULE__).get_default_class(__MODULE__)
    end
  end

  def get_default_class(component) do
    config = Surface.get_components_config()
    config[component][:default_class] || config[__MODULE__][:default_class]
  end

  defmodule InputContext do
    @moduledoc """
    Retrieves `form` and `field` values from the context.

    This module is deprecated. Use option `from_context` instead. Example:

        prop form, :form, from_context: {Form, :form}
    """

    @moduledoc deprecated: "Use option from_context instead"
    use Surface.Component

    @doc "The assigns of the host component"
    prop assigns, :map

    @doc "The code containing the input control"
    slot default, arg: %{form: :form, field: :any}

    @impl Surface.BaseComponent
    def transform(node) do
      message = """
      Component <InputContext> has been deprecated.

      Use option `from_context` instead. Example:

          prop form, :form, from_context: {Form, :form}

      """

      Surface.IOHelper.warn(message, node.meta.caller, node.meta.file, node.meta.line)

      node
    end

    def render(assigns) do
      form = Context.get(assigns, Surface.Components.Form, :form)
      field = Context.get(assigns, Surface.Components.Form.Field, :field)

      ~F"""
      <#slot {@default, form: @assigns[:form] || form, field: @assigns[:field] || field} />
      """
    end
  end
end
