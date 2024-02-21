defmodule Surface.Components.Form.ResetTest do
  use Surface.ConnCase, async: true

  alias Surface.Components.Form.Reset

  test "empty reset" do
    html =
      render_surface do
        ~F"""
        <Reset />
        """
      end

    assert html =~ """
           <input type="reset" value="Reset">
           """
  end

  test "setting the value" do
    html =
      render_surface do
        ~F"""
        <Reset value="ResetTheForm" />
        """
      end

    assert html =~ """
           <input type="reset" value="ResetTheForm">
           """
  end

  test "setting the class" do
    html =
      render_surface do
        ~F"""
        <Reset class="button" />
        """
      end

    assert html =~ ~r/class="button"/
  end

  test "setting multiple classes" do
    html =
      render_surface do
        ~F"""
        <Reset class="button primary" />
        """
      end

    assert html =~ ~r/class="button primary"/
  end

  test "passing other options" do
    html =
      render_surface do
        ~F"""
        <Reset opts={autofocus: "autofocus"} />
        """
      end

    assert html =~ """
           <input autofocus="autofocus" type="reset" value="Reset">
           """
  end

  test "events with parent live view as target" do
    html =
      render_surface do
        ~F"""
        <Reset value="ResetTheForm" click="my_click" />
        """
      end

    assert html =~ ~s(phx-click="my_click")
  end

  test "setting id and name through props" do
    html =
      render_surface do
        ~F"""
        <Reset id="countdown" name="countdown" />
        """
      end

    assert html =~ """
           <input id="countdown" name="countdown" type="reset" value="Reset">
           """
  end

  test "setting the phx-value-* values" do
    html =
      render_surface do
        ~F"""
        <Reset values={a: "one", b: :two, c: 3} />
        """
      end

    assert html =~ """
           <input phx-value-a="one" phx-value-b="two" phx-value-c="3" type="reset" value="Reset">
           """
  end
end
