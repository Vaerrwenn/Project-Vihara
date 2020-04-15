class MembersController < ApplicationController
    def index
      @members = Member.all.order(:created_at)

      if @members.blank?
        @members_result = "Blank"
      end
    end

    def show
      @member = Member.find(params[:id])
    end

    def new
      @member = Member.new
    end

    def create
      @member = Member.new(member_params)

      if @member.save
        flash[:success] = "Data saved!"
        redirect_to @member
      else
        flash[:error] = "Something went wrong"
        render 'new'
      end
    end

    def edit
      @member = Member.find(params[:id])
    end

    def update
      @member = Member.find(params[:id])
        if @member.update_attributes(member_params)
          flash[:success] = "Data was successfully updated!"
          redirect_to @member
        else
          flash[:error] = "Something went wrong"
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
