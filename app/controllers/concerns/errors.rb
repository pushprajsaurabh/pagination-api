module Errors
  extend ActiveSupport::Concern

  included do
    rescue_from RailsParam::Param::InvalidParameterError, with: :render_bad_request
  end
end
