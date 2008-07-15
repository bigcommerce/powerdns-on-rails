require File.dirname(__FILE__) + '/../spec_helper'

describe SearchController do
  fixtures :all
  
  before(:each) do
    session[:user_id] = users(:admin).id
  end
  
  it "should return results when searched legally" do
    post :results, :search => { :parameter => 'exa' }
    
    assigns['results'].should_not be_nil
    response.should render_template('results')
  end
  
  it "should redirect to the index page when nothing has been searched for" do
    post :results, :search => { :parameter => "" }
    
    response.should be_redirect
    response.should redirect_to( root_path )
  end

end
