class TransactionsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @member = Member.find(params[:member_id])
        @transaction = @member.transactions.create(transaction_params)
        @transaction.submitted_by = current_user.name

        if @transaction.save
            flash[:success] = "Data Transaksi berhasil disimpan!"
            redirect_to member_path(@member)
        else
            flash[:danger] = "Terjadi kesalahan ketika menyimpan data Transaksi. Silahkan dicoba lagi."
            redirect_to member_path(@member)
        end
    end

    def destroy
        @member = Member.find(params[:member_id])
        @transaction = @member.transactions.find(params[:id])

        if @transaction.destroy
            flash[:success] = 'Data Transaksi berhasil dihapus.'
            redirect_to member_path(@member)
        else
            flash[:danger] = 'Data Transaksi tidak dapat dihapus.'
            redirect_to member_path(@member)
        end
    end

    private
    def transaction_params
        params.require(:transaction).permit(:transaction_date, :receipt_no, :transaction_type, :saving_type, :currency, :money_value, :desc)
    end
end
