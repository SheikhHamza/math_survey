ActiveAdmin.register Quiz do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :qualtrics_survey_id, :qualtrics_response_id, :label,:start_time, :end_time, :difficulty, :score, :number_of_questions
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

form do |f|
  f.inputs "Quizzes" do
    if f.object.new_record?
      f.input :label
      f.input :number_of_questions
    end
  end
  f.actions
end

end
