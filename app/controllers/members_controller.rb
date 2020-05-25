# First of all, the codes you're about to see are probably not using the best practice method out there
# But hey, they get things work.
class MembersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:datatable]
    before_action :authenticate_user!
    
    def index
      # Not being used anymore but I'll just keep it. Will delete if the site's loading slowly.
      # respond_to do |format|
      #   format.html
      #   format.json { render json: MemberDatatable.new(params, view_context: view_context) }
      # end
    end

    def datatable
      render json: MemberDatatable.new(params, view_context: view_context)
    end

    def show
      @member = Member.find(params[:id])
      @transaction = @member.transactions.all.order(transaction_date: :desc)
    end

    def new
      @member = Member.new
    end

    def create
      @member = Member.new(member_params)

      if @member.save
        redirect_to @member
      else
        flash[:danger] = "Data Umat tidak berhasil disimpan. Silahkan dicoba lagi."
        render 'new'
      end
    end

    def edit
      @member = Member.find(params[:id])
    end

    def update
      @member = Member.find(params[:id])
        if @member.update_attributes(member_params)
          flash[:success] = "Data umat berhasil diubah!"
          redirect_to @member
        else
          flash[:error] = "Data umat tidak berhasil diubah. Silahkan dicoba lagi."
          render 'edit'
        end
    end

    def destroy
      @member = Member.find(params[:id])
      if @member.destroy
        flash[:success] = 'Data was successfully deleted.'
        redirect_to members_url
      else
        flash[:error] = 'Something went wrong'
        redirect_to members_url
      end
    end
    
    def home_index
      @members = Member.all
      @transactions = Transaction.all

      @results = Transaction.select("transactions.*, members.*").joins("JOIN members ON transactions.member_id = members.id")

      render "home/index"
    end
    
    private

    def member_params
      params.require(:member).permit(:name, :cetya, :phone, :account_number)
    end

end
