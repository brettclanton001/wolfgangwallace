class Admin::BaseController < ApplicationController
  http_basic_authenticate_with name: "wolfgang", password: "baileyishot"
end
