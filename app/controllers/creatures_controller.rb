class CreaturesController < ApplicationController
    # display all creatures
      def index
        # get all creatures from db and save to instance variable
        @creatures = Creature.all
        # render the index view (it has access to instance variable)
        # remember the default behavior is to render :index
      end
      def new
        @creature = Creature.new
        # remember the default behavior is to render :new
      end
      def create
        # whitelist params and save them to a variable
        creature_params = params.require(:creature).permit(:name, :description)
    
        # create a new creature from `creature_params`
        creature = Creature.new(creature_params)
    
        # if creature saves, redirect to route that displays
        # ONLY the newly created creature
        if creature.save
          redirect_to creature_path(creature)
          # redirect_to creature_path(creature) is equivalent to:
          # redirect_to "/creatures/#{creature.id}"
        end
      end
      def show
        # get the creature id from the url params
        creature_id = params[:id]
    
        # use `creature_id` to find the creature in the database
        # and save it to an instance variable
        @creature = Creature.find_by_id(creature_id)
    
        # render the show view (it has access to instance variable)
        # remember the default behavior is to render :show
      end
      def edit
        # get the creature id from the url params
        creature_id = params[:id]
    
        # use `creature_id` to find the creature in the database
        # and save it to an instance variable
        @creature = Creature.find_by_id(creature_id)
    
        # render the edit view (it has access to instance variable)
        # remember the default behavior is to render :edit
      end
      def update
        # get the creature id from the url params
        creature_id = params[:id]
    
        # use `creature_id` to find the creature in the database
        # and save it to an instance variable
        creature = Creature.find_by_id(creature_id)
    
        # update the creature
        creature.update_attributes(creature_params)  # this now calls the private method below!
    
        # redirect to show page for the updated creature
        redirect_to creature_path(creature)
        # redirect_to creature_path(creature) is equivalent to:
        # redirect_to "/creatures/#{creature.id}"
      end
      
      private
      
      def creature_params
        # whitelist params return whitelisted version
        params.require(:creature).permit(:name, :description) 
      end
    
    end