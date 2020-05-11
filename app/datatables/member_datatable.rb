class MemberDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegator :@view, :link_to

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
      name: { source: "Member.name", cond: :like, searchable: true, orderable: true},
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
    Member.all.order(:name)
  end

end
