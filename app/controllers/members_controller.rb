class MembersController < ApplicationController
    def index
      @members = Member.all.order(:name)

    end

    def show
      @member = Member.find(params[:id])
      @deposit = @member.deposits.all.order(created_at: :desc)
      @withdraw = @member.withdraws.all.order(created_at: :desc)
      @transaction = @member.transactions.all.order(created_at: :desc)
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
    
    
    private

    def member_params
      params.require(:member).permit(:name, :cetya, :phone)
    end

end
