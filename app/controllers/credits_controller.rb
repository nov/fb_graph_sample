class CreditsController < ApplicationController
  def create
    req = Facebook.auth.from_signed_request(params[:signed_request])
    order = req.data[:credits]
    res = case params[:method]
    when 'payments_get_items'
      {
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
      {
        :content => [{
          :order_id => order[:order_id],
          :status => :settled
        }],
        :method => "payments_status_update"
      }
    end
    logger.info res.to_json
    render :json => res
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
