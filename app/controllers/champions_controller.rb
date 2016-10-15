class ChampionsController < ApplicationController
  before_action :set_champion, only: [:show]

  # GET /champions
  # GET /champions.json
  def index
    @champions = Champion.all
  end

  # GET /champions/1
  # GET /champions/1.json
  def show
  end

  def refresh
    champions = Riot.get_champions(:image, :info, :lore, :spells, :passive, :recommended)
    refresh_champions(champions)

    items = Riot.get_items(:image, :gold)
    refresh_items(items)

    refresh_recommended_items(champions)

    redirect_to action: :index
  end

  def refresh_champions(champions_response)
    Champion.destroy_all
    champions_response['data'].each do |champion, data|
      Champion.create(id: data['id'], name: data['name'], title: data['title'], lore: data['lore'],
                      image: data['image'], info: data['info'], spells: data['spells'],
                      passive: data['passive']
                      )
    end
  end

  def refresh_items(items_response)
    Item.destroy_all
    items_response['data'].each do |item, data|
      Item.create(id: data['id'], name: data['name'], description: data['plaintext'],
        image: data['image'], gold: data['gold'])
    end
  end

  def refresh_recommended_items(champions_response)
    # in order to make things simpler, we will only get ESSENTIAL recommended items from SUMMONER'S RIFT map
    RecommendedItem.destroy_all
    champions_response['data'].each do |item, champion_data|
      champion_data['recommended'].each do |recommended_hash|
        # skip the other maps
        next unless recommended_hash['map'] == "SR" and recommended_hash['mode'] == "CLASSIC"
        recommended_hash['blocks'].each do |block|
          # skip the other recommended item types
          next unless block['type'] == 'essential'
          block['items'].each do |item|
            RecommendedItem.create(champion_id: champion_data['id'], item_id: item['id'])
          end
        end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_champion
      @champion = Champion.find(params[:id])
    end

    # # Never trust parameters from the scary internet, only allow the white list through.
    # def champion_params
    #   params.require(:champion).permit(:riot_id, :name, :title, :lore, :image, :info, :spells, :passive)
    # end
end
