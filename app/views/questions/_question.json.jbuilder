json.extract! question, :id, :survey_id, :text, :choices, :created_at, :updated_at
json.url question_url(question, format: :json)
