# frozen_string_literal: true

module ApplicationHelper
  def active?(path)
    ' active' if current_page?(path)
  end
end
