class CreditsController < ApplicationController
  def create
    req = Facebook.auth.from_signed_request(params[:signed_request])
    case params[:method]
    when 'payments_get_items'
      render :json => {
        :content => [{
          :title       => "Donation to fb_graph",
          :description => "Thanks for your donation!",
          :price       => 2,
          :image_url   => "http://www.facebook.com/images/gifts/21.png",
          :product_url => "http://www.facebook.com/images/gifts/21.png"
        }],
        :method => "payments_get_items"
      }
    when 'payments_status_update'
      render :text => 'settled'
    end
  end
end

# {
#     "signed_request" = >"...",
#     "buyer" = >"579612276",
#     "receiver" = >"579612276",
#     "order_id" = >"207732695940804",
#     "order_info" = >"\"Donation to fb_graph\"",
#     "test_mode" = >"1",
#     "method" = >"payments_get_items"
# }
