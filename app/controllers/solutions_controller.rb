class SolutionsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_solution, only: [:vote]

  authorize_resource class: 'Solution'

  def create
    @solution = Solution.new(solution_params)

    if @solution.save
      @solution.create_activity key: 'solution.create', owner: current_user
      redirect_to dest_path, flash: { success: t('crud.create.success') }
    else
      redirect_to root_path, flash: { error: t('crud.create.fail') }
    end
  end

  def vote
    if current_user.voted_on?(@solution)
      redirect_to dest_path, flash: { success: t('crud.vote.duplicate') }
    else
      vote = ActsAsVotable::Helpers::VotableWords.meaning_of(params[:vote])
      @solution.vote voter: current_user, vote: vote
      redirect_to dest_path, flash: { success: t('crud.vote.success') }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solution
      @solution = Solution.where(id: params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solution_params
      params.require(:solution).permit(:body, :question_id, :user_id)
    end

    def dest_path
      question_path(@solution.question)
    end
end
