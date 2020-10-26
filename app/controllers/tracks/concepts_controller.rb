class Tracks::ConceptsController < ApplicationController
  before_action :use_track
  before_action :use_concepts, only: :index
  before_action :use_concept, only: %i[show start complete]

  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @concept_map_data = Track::DetermineConceptMapLayout.(@track)

    if current_user&.joined_track?(@track)
      @concept_map_data[:status] = UserTrack::GenerateConceptStatusMapping.(@user_track)
      render action: "index/joined"
    else
      @concept_map_data[:status] = {}
      render action: "index/unjoined"
    end
  end

  def show
    # TODO: We don't want this here really.
    # Move it onto the concept eventually
    @concept_exercises = ConceptExercise.that_teach(@concept)
    @practice_exercises = PracticeExercise.that_practice(@concept)
  end

  private
  def use_track
    @track = Track.find(params[:track_id])
    @user_track = UserTrack.for(current_user, @track)
  end

  def use_concepts
    @concepts = @track.concepts
  end

  def use_concept
    @concept = @track.concepts.find(params[:id])
  end
end
