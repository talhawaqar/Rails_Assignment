class HomeController < ApplicationController
  
  def index
    @sites = Site.all.includes(:deals)
    
    label = [
      'NOV 20202',
      'DEC 2020',
      'JAN 2020',
      'FEB 2020',
      'MAR 2020',
      'APR 2020',
      'MAY 2020',
      'JUN 2020',
      'JUL 2020',
      'AUG 2020',
      'SEP 2020',
      'OCT 2020',
      'NOV 2020'
    ];

    sites_listing=[]
    @sites.each do |site|
      grouped_data = site.deals.where(listing_date: Date.new(2020,11,01)...Date.new(2021,11,30)).group_by{|deal| deal.listing_date.month}
      random_color = "rgb(#{(srand%256).to_s}, #{(srand%256).to_s}, #{(srand%256).to_s})"
      sites_listing.push({
        "data" => grouped_data.map{|group| group.second.count},
        "label" => site.title,
        "backgroundColor" => random_color,
        "borderColor" => random_color
      })
    end

    @data = {
      "labels" => label,
      "datasets" => sites_listing
    }
  end
end
