class AnswersController < ApplicationController

  def index
  end

  def show
    p "*" * 100
    p "*" * 100
    p "*" * 100
    p "*" * 100
    p session[:question_id] = params[:id]
    @questions = Question.find(session[:question_id])
    @answers = @questions.answers
    
  end

  def megusta

    
    p @id_question
    p answer_id = params[:id]
    @answer = Answer.find(answer_id)
    @answer.update(vote_like: (@answer.vote_like + 1))
    @answer_val = Answer.all.order(:id)

    redirect_to action: 'show', id: session[:question_id]

  end

  def medisgusta

    p "*" * 100
    p @id_question
    p answer_id = params[:id]
    @answer = Answer.find(answer_id)
    @answer.update(vote_dislike: (@answer.vote_dislike + 1))
    @answer_val = Answer.all.order(:id)

    redirect_to action: 'show', id: session[:question_id]

  end

end
