class QuestionsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_question, only: [:show, :vote]

  authorize_resource class: 'Question'

  def index
    @search = Question.active.search(params[:q])
    @questions = @search.result.page(params[:page]).per(10)
    if params[:tag]
      @questions = @questions.tagged_with(params[:tag])
    end
    @tags = @questions.tag_counts_on(:tags).order('count desc')
  end

  def new
    @question = Question.new
  end

  def show
    @solution = Solution.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to dest_path, flash: { success: t('crud.create.success') }
    else
      flash[:error] = t('crud.create.fail')
      render :new
    end
  end

  def vote
    if current_user.voted_on?(@question)
      redirect_to dest_path, flash: { warning: t('crud.vote.duplicate') }
    else
      vote = ActsAsVotable::Helpers::VotableWords.meaning_of(params[:vote])
      @question.vote voter: current_user, vote: vote
      redirect_to dest_path, flash: { success: t('crud.vote.success') }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.where(id: params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :body, :active, :tag_list, :user_id)
    end

    def dest_path
      question_path(@question)
    end

end
