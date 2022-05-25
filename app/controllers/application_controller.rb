class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_variables

  @icons_hash = {
    empty: 'empty icon',
    bill: 'bi bi-cash-stack',
    market_car: 'bi bi-cart',
    credit_card: 'bi bi-credit-card',
    wallet: 'bi bi-wallet2',
    bank: 'bi bi-bank',
    piggy: 'bi bi-piggy-bank',
    heart: 'bi bi-heart',
    house: 'bi bi-house-door',
    basket: 'bi bi-basket2',
    truck: 'bi bi-truck',
    bicycle: 'bi bi-bicycle',
    controller: 'bi bi-controller',
    musical_note: 'bi bi-file-music',
    images: 'bi bi-images',
    film: 'bi bi-film',
    palette: 'bi bi-palette',
    phone: 'bi bi-phone',
    gem: 'bi bi-gem',
    box: 'bi bi-box',
    pencil: 'bi bi-pencil',
    vector_pen: 'bi bi-vector-pen',
    bug: 'bi bi-bug',
    clipboard: 'bi bi-clipboard-pulse',
    clock: 'bi bi-clock',
    watch: 'bi bi-watch',
    inlove_em: 'bi bi-emoji-heart-eyes',
    smile_em: 'bi bi-emoji-smile',
    happy_em: 'bi bi-emoji-laughing',
    dizzy_em: 'bi bi-emoji-dizzy',
    sunglasses_em: 'bi bi-emoji-sunglasses',
    geo_alt: 'bi bi-geo-alt',
    pin: 'bi bi-pin',
    megaphone: 'bi bi-megaphone',
    trophy: 'bi bi-trophy',
    usb_drive: 'bi bi-usb-drive',
    exclamation: 'bi bi-exclamation-circle',
    wrench: 'bi bi-wrench-adjustable-circle',
    yin_yang: 'bi bi-yin-yang',
    person_square: 'bi bi-person-square',
    trash: 'bi bi-trash'
  }

  def set_variables
    @icons = {
      empty: 'empty icon',
      bill: 'bi bi-cash-stack',
      market_car: 'bi bi-cart',
      credit_card: 'bi bi-credit-card',
      wallet: 'bi bi-wallet2',
      bank: 'bi bi-bank',
      piggy: 'bi bi-piggy-bank',
      heart: 'bi bi-heart',
      house: 'bi bi-house-door',
      basket: 'bi bi-basket2',
      truck: 'bi bi-truck',
      bicycle: 'bi bi-bicycle',
      controller: 'bi bi-controller',
      musical_note: 'bi bi-file-music',
      images: 'bi bi-images',
      film: 'bi bi-film',
      palette: 'bi bi-palette',
      phone: 'bi bi-phone',
      gem: 'bi bi-gem',
      box: 'bi bi-box',
      pencil: 'bi bi-pencil',
      vector_pen: 'bi bi-vector-pen',
      bug: 'bi bi-bug',
      clipboard: 'bi bi-clipboard-pulse',
      clock: 'bi bi-clock',
      watch: 'bi bi-watch',
      inlove_em: 'bi bi-emoji-heart-eyes',
      smile_em: 'bi bi-emoji-smile',
      happy_em: 'bi bi-emoji-laughing',
      dizzy_em: 'bi bi-emoji-dizzy',
      sunglasses_em: 'bi bi-emoji-sunglasses',
      geo_alt: 'bi bi-geo-alt',
      pin: 'bi bi-pin',
      megaphone: 'bi bi-megaphone',
      trophy: 'bi bi-trophy',
      usb_drive: 'bi bi-usb-drive',
      exclamation: 'bi bi-exclamation-circle',
      wrench: 'bi bi-wrench-adjustable-circle',
      yin_yang: 'bi bi-yin-yang',
      person_square: 'bi bi-person-square',
      trash: 'bi bi-trash'
    }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name])
  end
end
