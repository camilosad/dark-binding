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
    @champions = Riot.get_champions(:image, :info, :lore, :spells, :passive)
    Champion.destroy_all

    @champions['data'].each do |champion, data|
      Champion.create(riot_id: data['id'], name: data['name'], title: data['title'], lore: data['lore'],
                      image: data['image'], info: data['info'], spells: data['spells'],
                      passive: data['passive']
                      )
    end

    redirect_to action: :index
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
