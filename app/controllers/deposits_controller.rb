class DepositsController < ApplicationController

    def new
        @member = Member.find(params[:member_id])
        # render partial: 'deposits/addDepositModal'
    end
    
    def create
        @member = Member.find(params[:member_id])
        @deposit = @member.deposits.create(deposit_params)

        if @deposit.save
            flash[:success] = "Data berhasil disimpan!"
            redirect_to member_path(@member)
        else
            flash[:danger] = "Terjadi kesalahan ketika menyimpan data Deposit. Silahkan dicoba lagi."
            redirect_to member_path(@member)
        end
    end

    def destroy
        @member = Member.find(params[:member_id])
        @deposit = @member.deposits.find(params[:id])

        if @deposit.destroy
            flash[:success] = 'Data Deposit berhasil dihapus.'
            redirect_to member_path(@member)
        else
            flash[:danger] = 'Data Deposit tidak dapat dihapus.'
            redirect_to member_path(@member)
        end
    end
    
    
    
    private
    def deposit_params
        params.require(:deposit).permit(:receipt_no, :deposit_type, :currency, :value, :desc)
    end

end
