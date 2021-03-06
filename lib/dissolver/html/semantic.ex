defmodule Dissolver.HTML.Semantic do
  @behaviour Dissolver.HTML.Theme
  use Phoenix.HTML

  @moduledoc """
  This is a theme to support Semantic UI.
  https://semantic-ui.com/
  """

  @impl Dissolver.HTML.Theme
  def generate_links(page_list, additional_class) do
    content_tag :nav, class: build_html_class(additional_class) do
      for {label, _page, url, current} <- page_list do
        link("#{label}", to: url, class: build_html_class(current))
      end
    end
  end

  defp build_html_class(true), do: "item active"
  defp build_html_class(false), do: "item"

  defp build_html_class(additional_class) do
    String.trim("ui pagination menu #{additional_class}")
  end
end
