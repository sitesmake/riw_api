class OrderedUsersQuery
  SORT_OPTIONS = %w(by_id by_age by_email).freeze

  def initialize(params = {}, relation = User)
    @relation = relation
    @params = params
  end

  def all
    @relation.public_send(sort_by, direction)
  end

  private

  def sort_by
    @params[:sort].presence_in(SORT_OPTIONS) || :by_id
  end

  def direction
    @params[:direction] == "asc" ? "acs" : "desc"
  end
end
