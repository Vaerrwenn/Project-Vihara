class MemberDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :link_to, :member_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      name: { source: "Member.name", cond: :like, searchable: true},
      cetya: { source: "Member.cetya", cond: :like, searchable: true, orderable: true}
    }
  end

  def data
    records.map do |record|
      {
        # example:
        # id: record.id,
        # name: record.name
        name: link_to(record.name, member_path(record)),
        cetya: record.cetya
      }
    end
  end

  def get_raw_records
    # insert query here
    # User.all
    Member.all
  end

end
