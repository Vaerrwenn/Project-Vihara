class HomeController < ApplicationController
  def index
    sql = "select t.*, m.name, m.cetya from transactions t 
    JOIN members m ON t.member_id = m.id order by created_at DESC"
    @results = ActiveRecord::Base.connection.exec_query(sql)
  end
end
# integrate Bootstrap 4 FA5 with RoR6
# https://medium.com/swlh/integrate-bootstrap-4-and-font-awesome-5-in-rails-6-fec52ee51753