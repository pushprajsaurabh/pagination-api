#
# Service layer to fetch the paginated response
#
# @author Pushp Raj Saurabh
#
class StatesService
  def initialize(per_page, page)
    @per_page = per_page
    @current_page = page
  end

  #
  # returns the paginated array of states of U.S.A. as per the request made.
  #
  # @return [Array] An array of states of U.S.A.
  def paginated_list
    @all_states = $us_states.split(',').map(& :strip).try(:sort)
    to_drop = (current_page - 1) * per_page
    data = @all_states.drop(to_drop)[0..(per_page - 1)]
    message = data.present? ? 'States successfully fetched' : 'No data exists for this page'
    response(data, message)
  end

  private

  attr_reader :per_page, :current_page

  def pagination_summary
    {
      current: current_page,
      per_page: per_page,
      pages: ((@all_states.count.to_f) / per_page).ceil,
      count: @all_states.count
    }
  end

  def response(data, message)
    {
      payload: data,
      meta: {
        success: true,
        message: message,
        pagination: pagination_summary
      }
    }
  end
end
