class CreditsController < ApplicationController
  def create
    # TODO
    auth = Facebook.auth.from_signed_request(params[:signed_request])
    transaction = auth.data[:credits]
    case transaction[:method]
    when 'payments_get_items'
      render :json => {
        :content => [{
          :title => "[Test Mode] Unicorn",
          :description => "[Test Mode] Own your own mythical beast!",
          :price => 2,
          :image_url => "http://www.facebook.com/images/gifts/21.png",
          :product_url => "http://www.facebook.com/images/gifts/21.png"
        }],
        :method => "payments_get_items"
      }
    when 'payments_status_update'
      render :nothing => true
    end
  end
end