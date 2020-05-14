class HomeDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :number_with_delimiter

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    # Mapping from the Database/Model
    @view_columns ||= {
      created_at:        { source: "Transaction.created_at", cond: :date_range, searchable: false },
      name:              { source: "Member.name" },
      cetya:             { source: "Member.cetya" },
      receipt_no:        { source: "Transaction.receipt_no" },
      transaction_type:  { source: "Transaction.transaction_type" },
      saving_type:       { source: "Transaction.saving_type" },
      currency:          { source: "Transaction.currency", searchable: false },
      money_value:       { source: "Transaction.money_value", searchable: false }
    }
  end

  def data
    records.map do |r|
      {
        # For passing the value to the View
        created_at:         r.created_at,
        name:               r.name,
        cetya:              r.cetya,
        receipt_no:         r.receipt_no,
        transaction_type:   r.transaction_type,
        saving_type:        r.saving_type,
        currency:           r.currency,
        money_value:        number_with_delimiter(r.money_value, delimiter: ".", separator: ",")
      }
    end
  end

  def get_raw_records
    # Query
    Transaction.select("transactions.*, members.name, members.cetya")
               .joins("JOIN members ON transactions.member_id = members.id")
  end
  
end
