module Api
  module V1
    #
    # Controller used to perform actions on the states of U.S.A.
    #
    # @author [pushp]
    #
    class StatesController < ApplicationController

      #
      # Returns all the states of USA in paginated manner.
      #
      # @param params [Hash] Parameters received from client with following keys:
      # {
      #   per_page: 5 (No. of entries per page),
      #   page: 1 (Page Number for which the records need to be fetched)
      # }
      #
      # @return [Hash] A paginated response with payload and meta.
      def index
        param! :per_page, Integer, default: 10, max: 50
        param! :page, Integer, default: 1
        response = StatesService.new(params[:per_page], params[:page]).paginated_list
        render json: {
          payload: response[:payload],
          meta: response[:meta]
        }, status: :ok
      end
    end
  end
end
