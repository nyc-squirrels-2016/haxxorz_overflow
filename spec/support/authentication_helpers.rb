module AuthenticationHelpers
  def stub_current_user user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  def stub_logged_in?
    allow_any_instance_of(ApplicationController).to receive(:logged_in?).and_return(true)
  end
end
# This does not work as of right now and I don't have a clue as to why. I've tried uncommenting out things that said they should work in the Rails helper and manually requiring this file in the questions_controller_spec file, but nothing has worked so far. If we can't get this going, we can't test anything that requires being logged in.
