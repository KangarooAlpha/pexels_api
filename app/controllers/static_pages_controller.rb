class StaticPagesController < ApplicationController
  def index
    @collection_id = params[:collection_id]

    if @collection_id.present?
      begin
        client = Pexels::Client.new(Rails.application.credentials.dig(:pexels, :api_key))
        @media = client.collections[@collection_id].media
      rescue => e
        @e = "Failed to get collection: #{e.message}"
      end
    end
  end
end
