class MemberDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :link_to, :member_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      name: { source: "Member.name" },
      account_number: { source: "Member.account_number" },
      cetya: { source: "Member.cetya", cond: :like, searchable: true, orderable: true} # Created this to help next dev to understand the syntax
    }
  end

  def data
    records.map do |record|
      {
        name: link_to(record.name, member_path(record)),
        account_number: record.account_number,
        cetya: record.cetya
      }
    end
  end

  def get_raw_records
    Member.all
  end

end
