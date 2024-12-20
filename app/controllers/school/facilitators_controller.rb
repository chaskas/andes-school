module School
  class FacilitatorsController < ApplicationController
    before_action :set_facilitator, only: %i[ show edit update destroy ]

    # GET /facilitators
    def index
      @facilitators = Facilitator.all
    end

    # GET /facilitators/1
    def show
    end

    # GET /facilitators/new
    def new
      @facilitator = Facilitator.new
    end

    # GET /facilitators/1/edit
    def edit
    end

    # POST /facilitators
    def create
      @facilitator = Facilitator.new(facilitator_params)

      if @facilitator.save
        redirect_to @facilitator, notice: "Facilitator was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /facilitators/1
    def update
      if @facilitator.update(facilitator_params)
        redirect_to @facilitator, notice: "Facilitator was successfully updated.", status: :see_other
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /facilitators/1
    def destroy
      @facilitator.destroy!
      redirect_to facilitators_url, notice: "Facilitator was successfully destroyed.", status: :see_other
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_facilitator
        @facilitator = Facilitator.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def facilitator_params
        params.require(:facilitator).permit(:name, :phone, :email, :address)
      end
  end
end
