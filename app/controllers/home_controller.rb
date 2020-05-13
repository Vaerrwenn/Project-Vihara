class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    # Not sure if this is a good practice but it get things work
    # Coudln't make Datatable to work with Home page because of this shit. Help.
    # sql = "select t.*, m.name, m.cetya from transactions t 
    # JOIN members m ON t.member_id = m.id order by created_at DESC"
    # @results = ActiveRecord::Base.connection.exec_query(sql)
    # FINALLY FOUND THE CORRECT WAY YAYYYYY
    # @results = Transaction.select("transactions.*, members.*")
    #                       .joins("JOIN members ON transactions.member_id = members.id")
    respond_to do |format|
      format.html
      format.json { render json: HomeDatatable.new(params, view_context: view_context) }
    end
  end
end
# integrate Bootstrap 4 FA5 with RoR6
# https://medium.com/swlh/integrate-bootstrap-4-and-font-awesome-5-in-rails-6-fec52ee51753