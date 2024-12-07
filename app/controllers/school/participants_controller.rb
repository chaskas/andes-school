module School
  class ParticipantsController < ApplicationController
    before_action :set_participant, only: %i[ show edit update destroy ]

    # GET /participants
    def index
      @participants = Participant.all
    end

    # GET /participants/1
    def show
    end

    # GET /participants/new
    def new
      @participant = Participant.new
    end

    # GET /participants/1/edit
    def edit
    end

    # POST /participants
    def create
      @participant = Participant.new(participant_params)

      if @participant.save
        redirect_to @participant, notice: "Participant was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /participants/1
    def update
      if @participant.update(participant_params)
        redirect_to @participant, notice: "Participant was successfully updated.", status: :see_other
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /participants/1
    def destroy
      @participant.destroy!
      redirect_to participants_url, notice: "Participant was successfully destroyed.", status: :see_other
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_participant
        @participant = Participant.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def participant_params
        params.require(:participant).permit(:name, :email)
      end
  end
end
