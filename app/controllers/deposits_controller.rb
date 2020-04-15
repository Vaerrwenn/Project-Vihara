class DepositsController < ApplicationController
    def create
        @member = Member.find(params[:member_id])
        @deposit = @member.deposits.create(deposit_params)

        if @deposit.save
            redirect_to member_path(@member)
        else
            render member_path(@member)
        end
    end
    
    private
    def deposit_params
        params.require(:deposit).permit(:receipt_no, :type, :currency, :value, :desc)
    end

end
