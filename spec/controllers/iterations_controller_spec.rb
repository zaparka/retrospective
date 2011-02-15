require 'spec_helper'

describe IterationsController do

  def mock_iteration(stubs={})
    (@mock_iteration ||= mock_model(Iteration).as_null_object).tap do |iteration|
      iteration.stub(stubs) unless stubs.empty?
    end
  end

  before(:each) do
    @project = mock_model(Project)
    Project.stub(:find).with(1) { @project }
  end

  describe "GET show" do
    it "assigns the requested iteration as @iteration" do
      Iteration.stub(:find).with("37") { mock_iteration }
      get :show, :id => "37", :project_id => 1
      assigns(:iteration).should be(mock_iteration)
    end
  end

  describe "GET new" do
    it "assigns a new iteration as @iteration" do
      Iteration.stub(:new) { mock_iteration }
      get :new, :project_id => 1
      assigns(:iteration).should be(mock_iteration)
    end
  end

  describe "GET edit" do
    it "assigns the requested iteration as @iteration" do
      Iteration.stub(:find).with("37") { mock_iteration }
      get :edit, :id => "37", :project_id => 1
      assigns(:iteration).should be(mock_iteration)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created iteration as @iteration" do
        Iteration.stub(:new).with({'these' => 'params'}) { mock_iteration(:save => true) }
        post :create, :iteration => {'these' => 'params'}, :project_id => 1
        assigns(:iteration).should be(mock_iteration)
      end

      it "redirects to the created iteration" do
        Iteration.stub(:new) { mock_iteration(:save => true) }
        post :create, :iteration => {}, :project_id => 1
        response.should redirect_to(project_iteration_url(@project, mock_iteration))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved iteration as @iteration" do
        Iteration.stub(:new).with({'these' => 'params'}) { mock_iteration(:save => false, :errors => { :anything => "any value (even nil)" } ) }
        post :create, :iteration => {'these' => 'params'}, :project_id => 1
        assigns(:iteration).should be(mock_iteration)
      end

      it "re-renders the 'new' template" do
        Iteration.stub(:new) { mock_iteration(:save => false, :errors => { :anything => "any value (even nil)" }) }
        post :create, :iteration => {}, :project_id => 1
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested iteration" do
        Iteration.should_receive(:find).with("37") { mock_iteration }
        mock_iteration.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :iteration => {'these' => 'params'}, :project_id => 1
      end

      it "assigns the requested iteration as @iteration" do
        Iteration.stub(:find) { mock_iteration(:update_attributes => true) }
        put :update, :id => "1", :project_id => 1
        assigns(:iteration).should be(mock_iteration)
      end

      it "redirects to the iteration" do
        Iteration.stub(:find) { mock_iteration(:update_attributes => true) }
        put :update, :id => "1", :project_id => 1
        response.should redirect_to(project_iteration_url(@project, mock_iteration))
      end
    end

    describe "with invalid params" do
      it "assigns the iteration as @iteration" do
        Iteration.stub(:find) { mock_iteration(:update_attributes => false) }
        put :update, :id => "1", :project_id => 1
        assigns(:iteration).should be(mock_iteration)
      end

      it "re-renders the 'edit' template" do
        Iteration.stub(:find) { mock_iteration(:update_attributes => false, :errors => { :anything => "any value (even nil)" }) }
        put :update, :id => "1", :project_id => 1
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested iteration" do
      Iteration.should_receive(:find).with("37") { mock_iteration }
      mock_iteration.should_receive(:destroy)
      delete :destroy, :id => "37", :project_id => 1
    end

    it "redirects to the iterations list" do
      Iteration.stub(:find) { mock_iteration(:project => @project) }
      delete :destroy, :id => "1", :project_id => 1
      response.should redirect_to(project_url(@project))
    end
  end

end
