module School
  class SessionDetailsController < ApplicationController
    before_action :check_feature_flag
    before_action :set_session_detail, only: %i[show edit update destroy]
    before_action :load_related_data, only: %i[new create edit update]

    def index
      @session_details = SessionDetail.all
    end

    def show
    end

    def new
      @session_detail = SessionDetail.new
    end

    def create
      @session_detail = SessionDetail.new(session_detail_params)
      if @session_detail.save
        redirect_to edit_session_detail_path(@session_detail), notice: 'Session detail was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @session_detail.update(session_detail_params)
        redirect_to edit_session_detail_path(@session_detail), notice: 'Session detail was successfully updated.'
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

    def load_related_data
      @participants = School::Participant.all
      @groups = School::Group.all
    end

    def session_detail_params
      params.require(:session_detail).permit(:title, :description, :targetable_id, :targetable_type)
    end

    def check_feature_flag
      context_attributes = {
        key: 'banana',
        kind: 'user',
        name: 'Banana User',
        email: 'banana@example.com',
        role: 'admin',
        country: 'US',
        is_premium: true
      }

      show_feature = FeatureFlagService.check_feature_flag('session-details-feature', context_attributes, false)

      return if show_feature

      redirect_to root_path, notice: 'This feature is Off.'

    end

  end
end
