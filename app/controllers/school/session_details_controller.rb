module School
  class SessionDetailsController < ApplicationController
    before_action :set_session_detail, only: %i[show edit update destroy]

    # def index
    #   @session_details = SessionDetail.all
    # end

    def show; end

    def new
      @session_detail = SessionDetail.new
      @participants = School::Participant.all
      @groups = School::Group.all
    end

    # def create
    #   @session_detail = SessionDetail.new(session_detail_params)
    #   if @session_detail.save
    #     redirect_to session_detail_path(@session_detail), notice: 'Session detail was successfully created.'
    #   else
    #     render :new, status: :unprocessable_entity
    #   end
    # end

    def edit
      @session_detail = School::SessionDetail.find(params[:id])
      @participants = School::Participant.all
      @groups = School::Group.all
    end

    def update
      if @session_detail.update(session_detail_params)
        redirect_to session_detail_path(@session_detail), notice: 'Session detail was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @session_detail.destroy
      redirect_to session_details_path, notice: 'Session detail was successfully deleted.'
    end

    private

    def set_session_detail
      @session_detail = SessionDetail.find(params[:id])
    end

    def session_detail_params
      params.require(:session_detail).permit(:title, :description, :targetable_id, :targetable_type)
    end
  end
end
