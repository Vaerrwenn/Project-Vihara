class WithdrawsController < ApplicationController
    def create
        @member = Member.find(params[:member_id])
        @withdraw = @member.withdraws.create(withdraw_params)

        if @withdraw.save
            flash[:success] = "Data berhasil disimpan!"
            redirect_to member_path(@member)
        else
            flash[:danger] = "Terjadi kesalahan ketika menyimpan data Penarikan. Silahkan dicoba lagi."
            redirect_to member_path(@member)
        end
    end

    def destroy
        @member = Member.find(params[:member_id])
        @withdraw = @member.withdraws.find(params[:id])

        if @withdraw.destroy
            flash[:success] = 'Data Penarikan berhasil dihapus.'
            redirect_to member_path(@member)
        else
            flash[:danger] = 'Data Penarikan tidak dapat dihapus.'
            redirect_to member_path(@member)
        end
    end

    private
    def withdraw_params
        params.require(:withdraw).permit(:receipt_no, :withdrawal_type, :currency, :value, :desc)
    end
end
