module QuestionHelper
  def question_form_title(title)
    title_type = {
      new: 'Create New',
      edit: 'Edit'
    }

    "#{ title_type[action_name.to_sym] } #{ title }"
  end
end
