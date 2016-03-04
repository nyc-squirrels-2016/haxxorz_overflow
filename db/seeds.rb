# 5.times {FactoryGirl.create(:user)}
5.times do
  FactoryGirl.create(:answer_comment)
  sleep(1)
end
5.times do
  FactoryGirl.create(:question_comment)
  sleep(1)
end
